# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :formated_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
