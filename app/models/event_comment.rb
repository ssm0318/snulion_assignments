class EventComment < ApplicationRecord
    belongs_to :user
    belongs_to :event
    has_many :event_replies
    has_many :event_comment_likes
    has_many :liking_event_comment_users, through: :event_comment_likes, source: :user
end
