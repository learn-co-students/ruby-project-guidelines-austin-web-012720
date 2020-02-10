class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.integer :spell_bot_id
      t.integer :damage
      t.string :element
      t.string :target
    end
  end
end
