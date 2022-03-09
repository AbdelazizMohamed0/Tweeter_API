class RemoveUsernameFromTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :username, :string
  end
end
