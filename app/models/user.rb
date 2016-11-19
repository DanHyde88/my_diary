class User < ApplicationRecord
    has_many :events, foreign_key: :creator_id
	  has_many :invites, foreign_key: :attendee_id
    has_many :attended_events, through: :invites
  validates :name,
    presence: true,
    length: {maximum: 20, too_long: 'maximum %{count} characters'},
    uniqueness: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    

end
