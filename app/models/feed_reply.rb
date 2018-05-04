class FeedReply < ApplicationRecord
    belongs_to :feed_comment
    belongs_to :user
end
