class FeedReply < ApplicationRecord
    belongs_to :feed_comment
    belongs_to :user

    has_many :feed_reply_likes
    has_many :liking_feed_reply_users, through: :feed_reply_likes, source: :user
end
