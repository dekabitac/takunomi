# frozen_string_literal: true

class DeviseCreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      ##genretable
      t.string :genre_name

     t.timestamps null: false
    end
  end
end
