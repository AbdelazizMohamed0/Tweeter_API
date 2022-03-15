# frozen_string_literal: true

class AddUsernameToTweets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :username
  end
end
