class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :shape_id
      t.float :shape_pt_lat
      t.float :shape_pt_lon
      t.integer :shape_pt_sequence
      t.float :shape_dist_traveled

      t.timestamps
    end
  end
end
