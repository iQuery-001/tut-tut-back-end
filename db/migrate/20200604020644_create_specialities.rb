class CreateSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :specialities do |t|
      t.integer :user_id
      t.string :skill

      t.timestamps
    end
  end
end
