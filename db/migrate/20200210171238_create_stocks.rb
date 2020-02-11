class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.integer :price
      t.float :percent_change
    end 
  end
end
