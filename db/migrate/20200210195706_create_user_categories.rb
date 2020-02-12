class CreateUserCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_categories do |t|
      t.integer :user_id
      t.integer :category_question_id
    end
  end
end
