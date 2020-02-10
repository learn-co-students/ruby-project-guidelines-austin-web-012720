class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.string :element
      t.integer :health
      t.integer :armor
      t.boolean :stealth
    end
  end
end
