class Event < ApplicationRecord
    belongs_to :user
    has_many :event_comments

    has_many :event_likes
    has_many :liking_users, through: :event_likes, source: :user
end
