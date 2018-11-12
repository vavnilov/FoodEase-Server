class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :cost_for_two
      t.string :cuisines
      t.string :image
      t.integer :price_range

      t.timestamps
    end
  end
end
