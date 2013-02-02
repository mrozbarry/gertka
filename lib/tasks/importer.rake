namespace :importer do
  desc "Imports GTFS files, can specify [FILENAME]"
  task :gtfs => :environment do
    require 'tmpdir'
    require 'fileutils'
    require 'zip/zip'
    require 'csv'

    MAPPING = {
      'agency.txt' => Agency,
      'calendar.txt' => Calendar,
      'calendar_dates.txt' => CalendarDate,
      'fare_attributes.txt' => FareAttribute,
      'routes.txt' => Route,
      'shapes.txt' => Shape,
      'stop_times.txt' => StopTime,
      'stops.txt' => Stop,
      'trips.txt' => Trip
    }

    filename = ENV["FILENAME"].present? ? ENV["FILENAME"] : "gtfs.zip"
    filepath = "#{Rails.root.join(filename)}"
    raise "Can't find file '#{filename}' to import" unless File.exists? filename
    puts "Importing #{filepath}"

    tmp_dir = Dir.mktmpdir

    extract_zip(filepath, tmp_dir)

    Dir.foreach(tmp_dir) do |item|
      next if item == '.' or item == '..'
      if MAPPING[item]
        puts "Processing #{item} as #{MAPPING[item]}"
        ActiveRecord::Base.transaction do
          CSV.read("#{tmp_dir}/#{item}", headers: true).each do |row|
            begin
              MAPPING[item].create!(row.to_hash)
            rescue Exception => e
              puts "Failed importing #{MAPPING[item]} because of #{e}"
            end
          end
        end
      end
    end

  end

  def extract_zip(source_path, tmp_dir)
    Zip::ZipFile.open(source_path) do |zip|
      zip.entries.each do |entry|
        zip.extract(entry.name, File.join(tmp_dir, '/', entry.name))
      end
    end
  end
end