class AddColFirstTimeToSpellbot < ActiveRecord::Migration[5.0]
  def change
    add_column :spellbots, :first_time, :boolean
  end
end
