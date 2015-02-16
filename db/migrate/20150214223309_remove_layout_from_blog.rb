class RemoveLayoutFromBlog < ActiveRecord::Migration
  def change
    remove_column :blogs, :layout, :integer
  end
end
