# frozen_string_literal: true

class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :name
      t.string :state
      t.timestamps
    end
  end
end
