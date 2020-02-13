require 'ruby2d'
# require 'japi'
require 'eventmachine'


class Jeopardy

    @@score = 0
    
        def intro
        # @think_song = Music.new('Jeopardy-theme-song.mp3')
        # @think_song.play
        Views.banner_jeopardy
        Jeopardy.greeting
    end

    def self.greeting
        yes_or_no = PROMPT.yes?("Welcome to Jeopardy! Are you a new user?")
        if yes_or_no
            @@current_user = User.create_user
            Jeopardy.about
        else
            Jeopardy.login
            Jeopardy.main_menu
        end
    end

    def self.main_menu
        puts "\n" *35
        Views.banner_jeopardy
        selection = PROMPT.select("",%w(Play Study Return_to_Main))
        case selection
        when "Play"
            Jeopardy.about
        when "Study"
            UserQuestion.study(@@current_user) 
        else
            Jeopardy.greeting
        end

    end

    def self.about
        Views.banner_jeopardy
        print "Johnny Gilbert: ".light_yellow
        puts"And now, here is the host of Jeopardy; Alex Trebek!"
        puts "\n" * 5
        sleep(4)
        print "Trebek: ".light_green
        puts "Thank you Johnny!"
        puts "\n" * 5
        sleep(2)
        print "Trebek: ".light_green
        puts "Jeopardy Lite will get you ready for your Jeopardy debut."
        puts "\n" * 5
        sleep(4)
        print "Trebek: ".light_green
        puts "Each incorrect response will be saved to your account for you to study."
        puts "\n" * 5
        sleep(4)
        print "Trebek: ".light_green
        puts "You will have one minute in Jeopardy and the Double Jeopardy rounds to answer questions."
        puts "\n" * 5
        sleep(5)
        print "Trebek:".light_green
        puts "On the Final Jeopardy round, you can place your wager and you will be given 30 seconds to guess the correct answer."
        Views.banner_jeopardy
        ready = PROMPT.yes?("The time will start now. Are you ready?")
        if ready
            Jeopardy.jeopardy_round 
        else
            Jeopardy.main_menu
        end
    end


    def self.login
        login_or_exit = PROMPT.select("", %w(Login Exit Delete_unusable_categories))
        case login_or_exit
        when "Login"
            self.find_user
            self.enter_password
        when "Exit"
            Views.banner_exit
            sleep(3)
          exit     
        else "Delete_unusable_categories"
            Question.check_category_length             
        end       
    end

    def self.find_user
        puts "\n" * 35
        find_user = PROMPT.ask("What is your username?".light_cyan, required: true)
        @@current_user = User.find_by(username: find_user)
        if @@current_user == nil
            puts "User not found".light_red
            puts "Please try again!"
            self.login
        end
    end

    def self.enter_password
        enter_password = PROMPT.mask('password:', echo: true,required: true)
        if enter_password == @@current_user.password
            @@current_user
        else
            puts "\n" * 35
            puts "Trebek: That was an incorrect response.".light_red
            puts "Please try again!".light_yellow
            self.enter_password
        end
    end

    def self.select_category
        puts "\n" * 35
        Views.select_category_banner
        random_selection = Question.all.sample(6)
       
        category_strings = random_selection.map{|cat| cat.category}
        #iterate over category strings and remove all html tags
        # RemoveTags.remove_html_tags(category_strings)
        # ActionView::Base.full_sanitizer.sanitize(@string)

        selection = PROMPT.select("Select a category", category_strings)
        questions = Question.all.select {|question| question.category == selection}
        case selection
        when category_strings[0]
            value = Views.select_value.to_i
            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
             else
                @@score -= value 
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save
                
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end
            
        when category_strings[1]
            value = Views.select_value.to_i

            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
             else
                @@score -= value 
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end        
        when category_strings[2]

            value = Views.select_value.to_i
            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
             else
                @@score -= value
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save 
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end
        when category_strings[3]
            value = Views.select_value.to_i
            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
             else
                @@score -= value 
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end
        when category_strings[4]
            value = Views.select_value.to_i
            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
                # binding.pry
             else
                @@score -= value 
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end
        else category_strings[5]

            value = Views.select_value.to_i
            if questions.find {|q| q.value == value} == nil
                user_question = questions.first
            else
                user_question = questions.find {|q| q.value == value}
            end
             answer = Views.display_question(user_question,questions,value)
             if answer == user_question.answer
                @@score += value
                print "Trebek:".light_green
                puts "That is correct"
                puts "Your score: #{@@score}"
             else
                @@score -= value 
                study_question = UserQuestion.new(user: @@current_user, question: user_question)
                study_question.save
                print "Trebek:".light_green
                print "That is incorrect.".light_red
                puts "The correct response is #{user_question.answer}. "
                puts "Your score: #{@@score}"
             end
        end
    end

    def self.jeopardy_round
      Jeopardy.timer
      Jeopardy.display_info

    end

    def self.timer
        EM.run do
          EM.add_timer(10) do
            puts "The time is up."
            EM.stop_event_loop
          end
        
          EM.add_periodic_timer(1) do
            Jeopardy.select_category
          end
        end
    
    end


    def self.final_timer
        wrong_answers = Question.all.find_by(category: "#{@@final_clue.category}")
        binding.pry
        EM.run do
          EM.add_timer(30) do
            puts "The time is up."
            EM.stop_event_loop
          end
        
          EM.add_periodic_timer(1) do
            puts "#{@@final_clue.question}"
            final_answer = PROMPT.select("#{}")
          end
        end
    
    end

    def self.double_jeopardy
      Jeopardy.timer
      Jeopardy.display_info_final_jeopardy
    end

    def self.final_jeopardy
      @@final_clue = Question.all.sample
      puts "You will have 30 seconds to answer the Final Jeopardy question."
      puts "The category is #{@@final_clue.category}"  
      wager = PROMPT.ask("How much would you like to wager?", required: true).to_i
      binding.pry
      Jeopardy.final_timer
      #the final_timer method displays the question for 30 seconds

      Jeopardy.display_info_end_of_game
      final_answer = PROMPT.select("#{}")
    end
    
    private

    def self.display_info
      puts "\n" * 35
      Views.banner_jeopardy  
      puts "Your score is #{@@score}."
      selection = PROMPT.select("Are you ready for Double Jeopardy?", %w(Yes Exit))
      case selection
      when "Yes"
        self.double_jeopardy  
      else "Exit"
          Views.banner_exit
          sleep(3)
        exit                  
      end      
    end

    def self.display_info_final_jeopardy
        puts "\n" * 35
        Views.banner_jeopardy  
        puts "Your score is #{@@score}."
        #screen out players whose score is < 1
        selection = PROMPT.select("Are you ready for the Final Round?", %w(Yes Exit))
        case selection
        when "Yes"
          self.final_jeopardy  
        else "Exit"
            Views.banner_exit
            sleep(3)
          exit                  
        end         
    end

    def self.display_info_end_of_game
        puts "\n" * 35
        Views.banner_jeopardy

        puts "Your score is #{@@score}."
        #fix code after this
        selection = PROMPT.select("Are you ready for the Final Round?", %w(Yes Exit))
        case selection
        when "Yes"
          self.final_jeopardy  
        else "Exit"
            Views.banner_exit
            sleep(3)
          exit                  
        end         
    end
end