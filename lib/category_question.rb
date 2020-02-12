class CategoryQuestion < ActiveRecord::Base
    has_many :user_categories
    has_many :users, through: :user_category


    def self.get_category_questions
      response = RestClient.get 'http://jservice.io/api/random?count=50'
      parsed_response = JSON.parse(response.body)

      parsed_response.each do |question|
        new_question = CategoryQuestion.find_or_create_by(question: question["question"])
        new_question.answer = question["answer"]
        new_question.value = question["value"]
        new_question.category_name = question["category"]["title"]
        #Some of the values are nil so we need to assign an optional value
        new_question.save
      end 
    end
  

end