class ChangeDatatypeOfCharacters < ActiveRecord::Migration[5.2]
  def change
    change_column :characters, :strength, :integer, null: false, default: 1
    change_column :characters, :intelligence, :integer, null: false, default: 1
    change_column :characters, :agility, :integer, null: false, default: 1
  end
end
