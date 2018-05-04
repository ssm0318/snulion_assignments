class CreateEventComments < ActiveRecord::Migration[5.1]
  def change
    create_table :event_comments do |t|
      t.belongs_to :user
      t.string :content, foreign_key: true
      t.integer :event_id

      t.timestamps
    end
  end
end
