class CreateCalendarDates < ActiveRecord::Migration
  def change
    create_table :calendar_dates do |t|
      t.string :service_id
      t.datetime :date
      t.integer :exception_type

      t.timestamps
    end
  end
end
