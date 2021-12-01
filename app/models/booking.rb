class Booking < ApplicationRecord
    belongs_to :user
    validates :from,:to,presence: true
end
