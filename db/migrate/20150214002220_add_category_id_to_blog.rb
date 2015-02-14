class AddCategoryIdToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :category_id, :integer
  end
end
