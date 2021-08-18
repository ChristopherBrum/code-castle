require 'pry'
require 'yaml'
require_relative 'image'
require_relative 'printable'
require_relative 'question'
require_relative 'villains'

=begin
Note: Game class will not function properly until Player class file
is available. Therefore, all Player dependent code is commented out
for the time being to allow testing
=end

class Game
  MESSAGES = YAML.load_file('../content/messaging.yml')

  include Printable

  attr_reader :player
  attr_accessor :type
  
  def initialize
    clear
    #@player = Player.new
    @type = nil
  end
  
  
  def play
    loop do
      clear
      display_welcome
      assign_game_type
      play_inner_loop
      display_game_over
      break unless play_again?
    end
    
    display_goodbye
  end
  
  def ask_game_type
    answer = nil
    print_centered "Would you like to play a (s)hort (m)edium or (l)ong game?"
    loop do 
      set_margin
      answer = gets.chomp.downcase
      break if valid_game_type?(answer)
      print_centered "Please enter 's', 'm' or 'l'."
    end
    answer[0]
  end
  
  def valid_game_type?(str)
    str.start_with?("s") || 
    str.start_with?("m") ||
    str.start_with?("l")
  end

  def display_welcome
    Image.new('../content/images/castle.txt').render
    # Do we add a welcome message that we can import from the .yml?
    # print_centered "Welcome, #{player.name}!"
    puts
  end
  
  def assign_game_type
    case ask_game_type
    when "s" then self.type = Short.new
    when "m" then self.type = Medium.new
    when "l" then self.type = Long.new
    end
  end
  
  # randomly generate results until gameplay / keeping score is implemented
  def won?
    [true, false].sample
    # TODO: implement a way to see if player has won
  end
  
  # TODO: figure out a way to break up longer messages for better formatting
  def display_game_over
    clear
    if won?
      Image.new('../content/images/victory.txt').render
      print_centered(MESSAGES['boss_winner'])
    else
      Image.new('../content/images/rip.txt').render
      print_centered(MESSAGES['boss_loser'])
    end
    puts
  end
      
  def play_again?
    print_centered "Would you like to play again? (y/n)"
    answer = nil
    loop do
      set_margin
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      print_centered "Please enter 'y' or 'n'"
    end
    answer == 'y'
  end
      
  def display_goodbye
    print_centered "Thank you for playing Code Castle! Goodbye!"
  end
      
  def play_inner_loop
    print_centered "You are playing a #{type.class} game"
    sleep(3)
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

Game.new.play