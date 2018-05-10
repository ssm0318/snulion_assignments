class FeedCommentLike < ApplicationRecord
    belongs_to :user
    belongs_to :feed_comment
end
