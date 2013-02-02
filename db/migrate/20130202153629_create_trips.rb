class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :block_id
      t.string :route_id
      t.string :trip_headsign
      t.string :service_id
      t.string :shape_id
      t.string :trip_id

      t.timestamps
    end
  end
end
