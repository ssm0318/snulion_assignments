class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
    #has_many :feeds #class_name: :Feed, foreign_key: :user_id (나를 찾아오려면 user_id를 사용해라) 와 같은 셈. 루비가 알아서 해줘서 생략됨.
    # def feeds
    #     Feed.where(user_id: self.id)        
    # end

    # def commented_feeds
    #     self.feed_comments.map do |x| # map은 array 형식으로 return 해줘!
    #         x.feed #이래서 through 다음에는 복수가, source 다음에는 단수가 오게 됨.
    #     end
    # end
    has_many :written_feeds, class_name: :Feed, foreign_key: :user_id #written feeds의 class를 모르니까 specify 해줘야함.
# def :written_feeds
#     Feed.where(user_id: id)
# end

  has_many :feed_comments
  has_many :feed_replies

  has_many :events
  has_many :event_comments
  has_many :event_replies

  has_many :feed_likes
  has_many :liked_feeds, through: :feed_likes, source: :feed
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth_2]

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end
end
