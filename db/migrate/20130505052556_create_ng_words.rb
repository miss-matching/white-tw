class CreateNgWords < ActiveRecord::Migration
  def change
    create_table :ng_words do |t|
      t.references :account, :null => false
      t.string :word

      t.timestamps
    end
    add_index :ng_words, :account_id
  end
end
