class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :parking_id
      t.string :code
      t.string :telephone
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
