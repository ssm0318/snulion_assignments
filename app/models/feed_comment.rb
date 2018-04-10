class FeedComment < ApplicationRecord
    belongs_to :feed
    has_many :feed_replies
end
