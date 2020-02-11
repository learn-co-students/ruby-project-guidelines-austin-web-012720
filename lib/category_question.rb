class CategoryQuestion < ActiveRecord::Base
    belongs_to :category

    def self.get_category_questions
      response = RestClient.get 'http://jservice.io/api/random?count=8'
      parsed_response = JSON.parse(response.body)

      parsed_response.each do |question|

        new_category = Category.find_or_create_by(api_id: question["category"]["id"])
        new_category.category_name = question["category"]['title']
        new_category.save

        new_question = CategoryQuestion.find_or_create_by(question: question["question"])
        new_question.answer = question["answer"]
        new_question.value = question["value"]
        #Some of the values are nil so we need to assign an optional value
        new_question.category_id = question["category_id"]
        new_question.save
        new_question
        binding.pry
      end 
    end
  

end