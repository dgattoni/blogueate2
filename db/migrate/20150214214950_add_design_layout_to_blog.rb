class AddDesignLayoutToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :designLayout, :integer
  end
end
