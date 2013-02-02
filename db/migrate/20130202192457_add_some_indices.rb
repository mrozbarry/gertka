class AddSomeIndices < ActiveRecord::Migration
  def change
    add_index :stops, :stop_id, :unique => true
    add_index :stop_times, :stop_id
    add_index :trips, :trip_id, :unique => true
    add_index :stop_times, :trip_id
    add_index :calendars, :service_id
    add_index :trips, :service_id
  end
end
