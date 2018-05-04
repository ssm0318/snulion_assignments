class EventComment < ApplicationRecord
    belongs_to :user
    belongs_to :event
    has_many :event_replies
end
