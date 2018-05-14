class CreateEventCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :event_comment_likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :event_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
