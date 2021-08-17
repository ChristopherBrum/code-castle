require_relative 'image'
require_relative 'printable'
require_relative 'question'

class Game
  attr_reader :player
  attr_accessor :type
  
  def initialize
    @player = Player.new
    @type = nil
  end
  
  
  def play
    loop do
      display_welcome
      assign_game_type
      play_inner_loop
      won? ? display_winning_message : display_losing_message
      break unless play_again?
    end
    
    display_goodbye
  end
  
  def ask_game_type
    answer = nil
    loop do 
      puts "Would you like to play a (s)hort (m)edium or (l)ong game?"
      answer = gets.chomp.downcase
      break if answer.start_with?("s") || answer.start_with?("m") || \
        answer.start_with?("l")
    end
    answer = answer[0]
    hash = { "s" => "short", "l" => "long", "m" => "medium" }
    hash[answer]
  end
  
  def display_welcome
    puts "Welcome to the Code Castle, #{player.name}!"
    Image.new('images/castle.txt').render
  end
  
  def assign_game_type
    case ask_game_type
    when "short" then self.type = Short.new
    when "medium" then self.type = Medium.new
    when "long" then self.type = Long.new
    end
  end
      
  def won?
    [true, false].sample
  end
  
  def display_losing_message
    puts "Sorry #{player.name}, you lost! You are not worthy of the Code Castle!"
  end
      
  def display_winning_message
    puts "Congratulations, #{player.name}! You win! Here are the keys to the CODE CASTLE!"
  end
      
  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Please enter 'y' or 'n'"
    end
    answer == 'y'
  end
      
  def display_goodbye
    puts "Thank you for playing Code Castle! Goodbye!"
  end
      
  def play_inner_loop
    puts "You are playing a #{type.class} game"
  end
end

class Short < Game 
  MAX_QUESTIONS = 10
  
  attr_reader :questions
  
  def initialize
    @questions = []
  end
  
#   def play
#     populate_questions
#     loop do 
#       # 
#     end
#   end
  
#   def populate_questions
#     # get 10 random questions from database
#     # add to @questions array
#   end
end

class Medium < Game
  MAX_QUESTIONS = 20
  
  def initialize
    @questions = []
  end
end

class Long < Game 
  MAX_QUESTIONS = 30
  
  def initialize
    @questions = []
  end
end