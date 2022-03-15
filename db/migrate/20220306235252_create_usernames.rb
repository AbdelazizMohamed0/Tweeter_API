# frozen_string_literal: true

class CreateUsernames < ActiveRecord::Migration[7.0]
  def change
    create_table :usernames do |t|
      t.string :first_name
      t.string :last_name
      t.float :age

      t.timestamps
    end
  end
end
