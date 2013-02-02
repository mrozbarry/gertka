class CreateStopTimes < ActiveRecord::Migration
  def change
    create_table :stop_times do |t|
      t.string :trip_id
      t.datetime :arrival_time
      t.datetime :departure_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.string :stop_headsign
      t.integer :pickup_type
      t.integer :drop_off_type
      t.float :shape_dist_traveled

      t.timestamps
    end
  end
end
