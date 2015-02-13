class RemovePermalinkFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :permalink, :string
  end
end
