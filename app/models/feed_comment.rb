class FeedComment < ApplicationRecord
    belongs_to :user
    belongs_to :feed
    has_many :feed_replies
    has_many :feed_comment_likes
    has_many :liking_feed_comment_users, through: :feed_comment_likes, source: :user
end
