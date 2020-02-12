

def self.select_value(category)
    questions = Question.all.select {|question| question.category == category}
    select_value = PROMPT.select("Select value", %w(100 200 400 600 800 1000))
  end


  