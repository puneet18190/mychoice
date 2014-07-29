class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_name, :string
    add_column :users, :profile_pic, :string
    add_column :users, :cover_pic, :string
    add_column :users, :location, :string
    add_column :users, :facebook_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :website_link, :string
  end
end
