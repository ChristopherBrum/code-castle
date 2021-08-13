=begin
Code Castle is a storytelling RPG based game in which a single player answers quiz questions to defeat enemies and reclaim the Castle for the forces of good. 

Game Play:

The Player is welcomed and the rules are explained
The Player selects certain options:
  - Player name
  - Short game (10 Questions), Medium Game (20 Questions), Long Game (30 Questions)
The Player is presented with an Enemy who demands an answer to a Question
If the Player answers the question right they may advance to the next enemy
  - They gain a Special Token
  - The player must have X Amount Special Tokens to beat the final
If the Player answers the question wrong, they cannot advance, they must answer another question from the same enemy
   - If the player answers wrong, they lose a "life"
   - A player starts out with lives that are 3% of game length
If the player answers all questions right and advances through each round of enemies, they have the correct number of Special Tokens
If the player does not answer all the questions right, they don't have enough special tokens
When the player runs out of questions/attempts, they are brought to a special final round screen where they have to fight the final boss, if they have the correct number of Special Tokens they win
A goodbye message that says either:
  - You finished you cannot advance farther please try again
  - You win


Player, Enemies, Questions/Attempts, Special Tokens, Lives, Short Game, Medium Game, Long Game
answers, selects, defeats, attempts, collects, fights final round, 
=end

module Printable
  # contain all displaying, formatting, animating, etc code
end

class Player
  def initialize
    @tokens = []
    @lives = # 3% of number of questions
  end
  
  def choose_your_name; end
  
  def choose_game_length; end
  
  def answer_question; end
  
  def defeat_enemy; end
  
  def collect_token; end
  
  def loose_a_life; end
end

class Enemy
  # @name
  # @power
  # @description
  
  def ask_a_question; end
end

class Question
  # @answer
  # @description
  # @code snippet
  # @output
  
  def output_question; end
  
  def check_answer; end
end

class Game
  def initialize
    @player = Player.new
    @questions = []
    @enemies = []
  end
  
  def display_welcome; end
  
  def choose_options; end
  
  def play_game
    welcome_message
    choose_options

    # this probably in one of the child game classes
    loop do
      play_single_round
      break if player.out_of_attempts?
    end
    
    fight_final_round unless player.out_of_lives?
    display_end_message
  end
end

class ShortGame < Game
  # methods pertaining to the specific implementation of a short game
end

class MediumGame < Game
    # methods pertaining to the specific implementation of a medium game
end

class LongGame < Game
    # methods pertaining to the specific implementation of a long game
end
