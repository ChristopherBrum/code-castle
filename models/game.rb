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
      type.play
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

class InnerGame < Game
  attr_reader :questions
  attr_accessor :level
  attr_reader :villains

  def initialize
    @questions = []
    @level = 0
    @villains = Villains.new
  end

  def play
    loop do
      clear
      print_centered(level_message)
      villain_display
      # TODO implement question asking and answer check
      ask_question
      # Note, this loop will break and raise an error once we run out of levels
      break if out_of_questions?
      next_level
    end

  end

  def level_message
    MESSAGES['lair_intros'][level]
  end

  def villain_display
    # call select to get rid of nil elements
    print_centered(MESSAGES['villain_intro'].select { |ele| ele }.sample)
    villains.display!
    print_centered(MESSAGES['villain_taunts'].select { |ele| ele }.sample)
  end

  def ask_question
    loop do
      print_centered("What is the air speed velocity of an unladen swallow?")
      set_margin
      answer = gets.chomp
      puts
      break unless answer.empty?
      print_centered(MESSAGES['level']['retry'])
    end
    print_centered(MESSAGES['level']['victory'])
    sleep(3)
  end

  def out_of_questions?
    level == (self.class::MAX_QUESTIONS - 1)
  end

  def next_level
    self.level += 1
  end
end

class Short < InnerGame 
  MAX_QUESTIONS = 10
end

class Medium < InnerGame
  MAX_QUESTIONS = 20
end

class Long < InnerGame 
  MAX_QUESTIONS = 30
end

Game.new.play