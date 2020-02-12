class Question < ActiveRecord::Base
    has_many :user_questions
    has_many :users, through: :user_questions


    def self.get_category_questions
      response = RestClient.get 'http://jservice.io/api/random?count=50'
      parsed_response = JSON.parse(response.body)

      parsed_response.each do |question|
        new_question = self.find_or_create_by(question: question["question"])
        new_question.answer = question["answer"]
        if question["value"] == nil 
          new_question.value = 100 
        else 
          new_question.value = question["value"]
        end
        new_question.category = question["category"]["title"]
        #Some of the values are nil so we need to assign an optional value
        new_question.save
      end 
    end

    def self.select_value(category)
      questions = Question.all.select {|question| question.category == category}
      binding.pry
      select_value = PROMPT.select("Select value", %w(100 200 400 600 800 1000))
    end
  
    def self.check_enough_questions(question_sample)
      categories_to_check = question_sample.map {|question| question.category}
      categories_to_check.map do |category_string|
        if Question.where(category: category_string).length > 5
          
        else
          
        end
      end
    end

end