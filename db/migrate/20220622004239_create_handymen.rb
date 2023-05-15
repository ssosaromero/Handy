class CreateHandymen < ActiveRecord::Migration[6.1]
  def change
    create_table :handymen do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
