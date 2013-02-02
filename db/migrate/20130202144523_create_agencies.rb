class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :agency_phone
      t.string :agency_url
      t.string :agency_id
      t.string :agency_name
      t.string :agency_timezone
      t.string :agency_lang

      t.timestamps
    end
  end
end
