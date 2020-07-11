class CreateParticipantManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_managements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recruitment, null: false, foreign_key: true
      t.boolean :acceptance, null: false, default: false
      t.string :comment

      t.timestamps
    end
  end
end
