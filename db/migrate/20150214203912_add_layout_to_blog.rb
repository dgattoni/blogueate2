class AddLayoutToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :layout, :integer
  end
end
