class AddColMaxHealthToSpellbot < ActiveRecord::Migration[5.0]
  def change
    add_column :spellbots, :max_health, :integer
  end
end
