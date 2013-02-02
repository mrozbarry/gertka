class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :route_long_name
      t.integer :route_id
      t.integer :route_type
      t.string :route_text_color
      t.string :agency_id
      t.string :route_color
      t.string :route_url
      t.string :route_short_name

      t.timestamps
    end
  end
end
