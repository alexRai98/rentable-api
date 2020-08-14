class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :operation_type
      t.string :addres
      t.float :monthly_rent
      t.float :maintenance
      t.integer :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :area
      t.string :apartment_amenities, array: true, default: []
      t.string :building_amenities, array: true, default: []
      t.string :close_by, array: true, default: []
      t.boolean :pets_allowed
      t.text :description
      t.integer :favorites_count, default: 0
      t.references :owner, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
