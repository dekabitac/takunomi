# frozen_string_literal: true

class DeviseCreatePostGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :post_genres do |t|
      #post_genretable
      t.integer :post_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
