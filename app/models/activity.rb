class Activity < ApplicationRecord
  belongs_to :course
  has_many :bookings
end
