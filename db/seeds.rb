# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'hello@snulion.com', name: 'j1', password: "j1j1j1")
User.create(email: 'bye@snulion.com', name: 'j2', password: 'j2j2j2')
User.create(email: 'thanks@snulion.com', name: 'j3', password: 'j3j3j3')
User.create(email: 'ok@snulion.com', name: 'j4', password: 'j4j4j4')
User.create(email: 'hmmm@snulion.com', name: 'j5', password: 'j5j5j5')
User.create(email: 'alright@snulion.com', name: 'j6', password: 'j6j6j6')
User.create(email: 'yay@snulion.com', name: 'j7', password: 'j7j7j7')


user = User.all
user.each do |user|
    for i in 1..2 do
        Feed.create(title: user.name + "의 feed", content: user.name + "의 feed content", user_id: user.id)
        Event.create(title: user.name + "의 event", datetime: "2018-01-01 01:00:00", user_id: user.id)
    end
end

for j in 1..12 do
    FeedComment.create(content: "댓글입니다~", feed_id: rand(1..Feed.all.size), user_id: rand(1..User.all.size))
    EventComment.create(content: "댓글입니다~", event_id: rand(1..Event.all.size), user_id: rand(1..User.all.size))
end

for k in 1..15 do
    FeedReply.create(content: "대댓글입니다!!!!!!!", feed_comment_id: rand(1..FeedComment.all.size), user_id: rand(1..User.all.size))
    EventReply.create(content: "대댓글입니다!!!!!!!", event_comment_id: rand(1..EventComment.all.size), user_id: rand(1..User.all.size))
end

