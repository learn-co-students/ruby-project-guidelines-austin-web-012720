class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.boolean :complete
      t.integer :challenge_id
      t.integer :location_id
    end
  end
end
