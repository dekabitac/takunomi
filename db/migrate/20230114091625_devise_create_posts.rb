# frozen_string_literal: true

class DeviseCreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      ## posttable
      t.integer :customer_id
      t.text :post_text

      t.timestamps null: false
    end
  end
end
