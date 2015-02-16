class AddSlugIndexToBlog < ActiveRecord::Migration
  def change
  	add_index :blogs, :slug
  end
end
