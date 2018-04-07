class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content, foreign_key: true
      t.integer :feed_id

      t.timestamps
    end
  end
end
