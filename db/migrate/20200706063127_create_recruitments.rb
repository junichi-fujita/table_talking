class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :appropriate_level, null: false
      t.string :master_name, null: false
      t.datetime :start_time, null: false
      t.integer :play_time, null: false
      t.timestamps
    end
  end
end
