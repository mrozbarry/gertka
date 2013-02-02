class Calendar < ActiveRecord::Base
  attr_accessible :end_date, :friday, :monday, :saturday, :service_id, :start_dat, :sunday, :thursday, :tuesday, :wednesday
end
