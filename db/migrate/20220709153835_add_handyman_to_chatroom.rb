class AddHandymanToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :handyman, null: false, foreign_key: true
  end
end
