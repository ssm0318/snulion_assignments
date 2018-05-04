class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.date :datetime
      t.string :title
      
      t.timestamps
    end
  end
end
