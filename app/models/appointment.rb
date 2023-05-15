class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :handyman
  has_many :reviews, dependent: :destroy
  validates :date, presence: true
  validates :description, presence: true
  validates :skill, presence: true

  def reviewed?
    reviews = self.reviews.filter do |r|
      r.author == User.find(user_id).email
    end
    reviews.count.positive?
  end
end
