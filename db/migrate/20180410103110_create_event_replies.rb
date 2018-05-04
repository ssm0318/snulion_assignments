class CreateEventReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :event_replies do |t|
      t.belongs_to :user
      t.string :content
      t.integer :event_comment_id

      t.timestamps
    end
  end
end
