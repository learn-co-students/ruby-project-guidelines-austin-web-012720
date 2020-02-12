class CreateCategoryQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_questions do |t|
      t.string :category_name
      t.string :question 
      t.integer :value
      t.text :answer
      t.integer :user_id
    end
  end
end
