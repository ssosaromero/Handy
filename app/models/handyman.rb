class Handyman < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :location ],
  associated_against: {
    skills: %i[name description]
  },
  using: {
    tsearch: { prefix: true }
  }

  def avr_rating
    # creo la variable de suma
    sum = 0
    # cuento los reviews
    count = self.rating_count
    # suma de las estrellas de cada review
    self.reviews.filter { |r| r.author != self.user.email }.each do |r|
      sum += r.stars
    end

    # calculo el promedio
    if count.zero?
      0
    else
      sum / count
    end
  end

  def rating_count
    self.reviews.filter { |r| r.author != self.user.email }.count
  end

  def has_chat?
    self.chatrooms.where(user_id: current_user.id).present?
  end
end
