class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      #title과 content의 타입을 정해줌.
      t.string :title
      t.text :content
      
      t.timestamps
    end
  end
end
