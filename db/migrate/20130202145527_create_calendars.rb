class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :service_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.timestamps
    end
  end
end
