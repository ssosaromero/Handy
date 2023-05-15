class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.references :handyman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
