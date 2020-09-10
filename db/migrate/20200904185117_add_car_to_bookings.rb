class AddCarToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :car, null: false, foreign_key: true
  end
end
