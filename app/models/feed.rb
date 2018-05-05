class Feed < ApplicationRecord
    #belongs_to :user
    def user
        User.find(self.user_id)
    end
    has_many :feed_comments, dependent: :destroy

    has_many :feed_likes
    has_many :liking_users, through: :feed_likes, source: :user
end
