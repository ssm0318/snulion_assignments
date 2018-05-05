class CreateFeedLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :feed_likes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :feed_id, null: false, foreign_key: true #null이 반드시 있어야 함을 설정한 것. foreign key는 없이 생성이 안되도록 설정.

      t.timestamps
    end
  end
end
