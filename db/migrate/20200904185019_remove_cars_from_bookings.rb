class RemoveCarsFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :cars, null: false, foreign_key: true
  end
end
