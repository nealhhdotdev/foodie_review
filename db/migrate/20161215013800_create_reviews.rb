class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :body
      t.integer :rating

      t.timestamps null: false
    end
  end
end
