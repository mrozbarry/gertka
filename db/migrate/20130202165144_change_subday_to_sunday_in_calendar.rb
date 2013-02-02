class ChangeSubdayToSundayInCalendar < ActiveRecord::Migration
  def up
    rename_column :calendars, :subday, :sunday
  end

  def down
    rename_column :calendars, :sunday, :subday
  end
end
