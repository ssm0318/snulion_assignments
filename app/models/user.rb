class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :feeds
  has_many :feed_comments
  has_many :feed_replies
  has_many :events
  has_many :event_comments
  has_many :event_replies
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
