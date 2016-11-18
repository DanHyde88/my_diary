class User < ApplicationRecord
  belongs_to :created_event
  belongs_to :attended_event
end
