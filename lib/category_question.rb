class CategoryQuestion < ActiveRecord::Base
    belongs_to :category

    def self.get_category_questions
        response = RestClient.get 'http://jservice.io/api/random?count=8'
        parsed_response = JSON.parse(response.body)
        parsed_response.each do |question|
            binding.pry
         cat_question = CategoryQuestion.new 
        end 
      end
      #to access question category["question"]
      #to access answer category["answer"]
      #to access value category["value"]
      #to access api_id question["category"]["id"]
end