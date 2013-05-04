class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :twitter_id
      t.string :twitter_token
      t.string :twitter_secret
      t.datetime :last_login

      t.timestamps
    end
  end
end
