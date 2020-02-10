class CreateCategoryQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_questions do |t|
      t.integer :category_id
      t.string :question 
      t.integer :value
      t.text :answer
    end
  end
end
