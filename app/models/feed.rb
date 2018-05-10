class Feed < ApplicationRecord
    belongs_to :user
    
    # def user
    #     User.find(self.user_id)
    # end

    belongs_to :writer, class_name: "User", foreign_key: :user_id 
    #이 경우는 feed의 writer을 찾을 때 user_id를 통해 찾는데, 그냥 두면 weriter_id로 foreign_key가 세팅되니 specify해줘야함.
    
    has_many :feed_comments, dependent: :destroy

    has_many :feed_likes
    has_many :liking_users, through: :feed_likes, source: :user

end
