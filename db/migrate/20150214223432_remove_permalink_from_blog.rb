class RemovePermalinkFromBlog < ActiveRecord::Migration
  def change
    remove_column :blogs, :permalink, :string
  end
end
