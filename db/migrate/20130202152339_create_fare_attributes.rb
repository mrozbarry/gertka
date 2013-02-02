class CreateFareAttributes < ActiveRecord::Migration
  def change
    create_table :fare_attributes do |t|
      t.string :fare_id
      t.float :price
      t.string :currency_type
      t.integer :payment_method
      t.integer :transfers
      t.integer :transfer_duration

      t.timestamps
    end
  end
end
