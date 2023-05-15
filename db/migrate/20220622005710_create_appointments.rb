class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.text :description
      t.string :status
      t.string :skill
      t.references :user, null: false, foreign_key: true
      t.references :handyman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
