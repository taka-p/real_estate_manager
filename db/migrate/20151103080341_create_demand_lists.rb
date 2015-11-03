class CreateDemandLists < ActiveRecord::Migration
  def change
    create_table :demand_lists do |t|
      t.string :customer_name
      t.string :address_1
      t.string :address_2
      t.integer :estate_type
      t.integer :price
      t.string :wayside
      t.string :station
      t.integer :walking_time
      t.float :land_area
      t.float :building_area
      t.float :exclusive_area

      t.timestamps null: false
    end
  end
end
