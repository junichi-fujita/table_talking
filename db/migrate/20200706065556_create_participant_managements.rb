class CreateParticipantManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_managements do |t|
      t.references :user, null: false
      t.references :recruitment, null: false
      t.boolean :acceptance, null: false, default: false
      t.integer :application
      t.string :comment

      t.timestamps
    end
  end
end
