class AddColumnTweets < ActiveRecord::Migration[5.2]
  def change
    add_index :tweets,  :place, length: 32
    add_index :tweets,  :title, length: 32
  end
end
