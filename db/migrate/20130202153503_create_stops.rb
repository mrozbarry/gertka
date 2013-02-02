class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.float :stop_lat
      t.string :zone_id
      t.float :stop_lon
      t.string :stop_id
      t.string :stop_desc
      t.string :stop_name
      t.integer :location_type

      t.timestamps
    end
  end
end
