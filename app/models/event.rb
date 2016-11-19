class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
	has_many :invites, foreign_key: "attended_event_id"
    has_many :attendees, through: :invites

    validates :title,
        presence: true

    validates :location,
        presence: true

    validates :description,
        presence: true

    #delegate :title, :location, :description, :date, to: :?? Look at this if law of demeter broken??
end
