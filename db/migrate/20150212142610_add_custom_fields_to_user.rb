class AddCustomFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :permalink, :string
    add_column :users, :bio, :text
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :linkedin, :string
  end
end
