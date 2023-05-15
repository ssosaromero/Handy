class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :handyman, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_one_attached :photo

  def is_handyman?
    handyman = Handyman.find_by(user_id: id)
    return true if handyman
  end

  def full_name
    "#{self.first_name} #{self.last_name}".strip
  end
end
