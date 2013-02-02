class FareAttribute < ActiveRecord::Base
  attr_accessible :currency_type, :fare_id, :payment_method, :price, :transfer_duration, :transfers
  
end
