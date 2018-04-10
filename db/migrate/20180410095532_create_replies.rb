class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :content, foreign_key: true
      t.integer :feed_comment_id

      t.timestamps
    end
  end
end
