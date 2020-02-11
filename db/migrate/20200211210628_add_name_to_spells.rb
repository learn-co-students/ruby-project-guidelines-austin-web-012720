class AddNameToSpells < ActiveRecord::Migration[5.0]
  def change
    add_column :spells, :name, :string
  end
end
