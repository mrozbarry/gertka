class StopIdIsString < ActiveRecord::Migration
  def change
    change_column :stop_times, :stop_id, :string
  end
end
