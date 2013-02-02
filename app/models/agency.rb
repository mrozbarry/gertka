class Agency < ActiveRecord::Base
  attr_accessible :agency_id, :agency_lang, :agency_name, :agency_phone, :agency_timezone, :agency_url
end
