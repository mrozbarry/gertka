class AddSomeMoreIndicies < ActiveRecord::Migration
  def change
    add_index :calendars, :monday
    add_index :calendars, :tuesday
    add_index :calendars, :wednesday
    add_index :calendars, :thursday
    add_index :calendars, :friday
    add_index :calendars, :saturday
    add_index :calendars, :sunday
    add_index :calendars, :start_date
    add_index :calendars, :end_date
  end
end
