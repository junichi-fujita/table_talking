class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.integer :race, null: false, default: 0
      t.integer :job, null: false, default: 0
      t.integer :level, null: false, default: 1
      t.integer :strength, null: false
      t.integer :agility, null: false
      t.integer :intelligence, null: false
      t.integer :money, null: false, default: 0
      t.text :stock
      t.integer :experience, null: false, default: 0
      t.integer :max_hit_point, null: false, default: 10
      t.integer :current_hit_point, null: false, default: 10
      t.integer :max_magic_point, null: false, default: 10
      t.integer :current_magic_point, null: false, default: 10
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :evasion, null: false

      t.timestamps
    end
  end
end
