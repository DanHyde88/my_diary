class User < ApplicationRecord
  validates :name,
    presence: true,
    length: {maximum: 20, too_long: 'maximum %{count} characters'},
    uniqueness: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    

end
