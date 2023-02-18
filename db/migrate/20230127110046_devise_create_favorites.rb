# frozen_string_literal: true

class DeviseCreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.integer :customer_id
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
