class AddUsersToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :users, foreign_key: true
  end
end
