class Stop < ActiveRecord::Base
 reverse_geocoded_by :stop_lat, :stop_lon

  has_many :stop_times, :primary_key => :stop_id

  scope :busses_today, lambda {
    wday = [:sunday,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday][Date.today.wday]

    joins(:stop_times => {:trip => :calendar}).
        where(:calendars => {
          wday => true,
          :start_date => (Time.at(0)..Time.now),
          :end_date => (Time.now..Time.parse('2038-01-01')),
        }).
        group('stops.stop_id')
  }

  scope :route_soon, lambda { |route|
    joins(:stop_times => {:trip => [:calendar, :route]}).
      where(
        :stop_times => {:arrival_time => ((Time.now - 10.minutes) .. (Time.now. + 1.hour))},
        :routes => {:route_id => route}
      ).
      group('stops.stop_id').busses_today
  }
end
