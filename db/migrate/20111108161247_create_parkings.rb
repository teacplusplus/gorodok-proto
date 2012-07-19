class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :price_per_hour
      t.integer :day_start
      t.integer :day_end
      t.text :telephones

      t.timestamps
    end
  end
end
