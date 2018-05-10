class CreateFeedCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :feed_comment_likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :feed_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
