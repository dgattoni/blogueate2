class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :entryTitle
      t.string :entryContent
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end
