class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
