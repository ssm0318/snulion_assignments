class FeedReplyLike < ApplicationRecord
    belongs_to :user
    belongs_to :feed_reply
end
