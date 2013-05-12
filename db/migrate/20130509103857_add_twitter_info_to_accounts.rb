class AddTwitterInfoToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :twitter_image_url, :string
    add_column :accounts, :twitter_screen_name, :string
  end
end
