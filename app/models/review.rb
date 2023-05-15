class Review < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
  belongs_to :handyman
end
