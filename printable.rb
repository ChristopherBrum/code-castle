require 'io/console'


module Printable
  CSI = "\e["
  @@rows, @@columns = IO.console.winsize

  def clear
    system("clear") || system("clys")
  end

  def print_centered(message)
    puts message.center(@@columns)
  end

  def window_too_small?
    @@rows < 50 || @@columns < 100
  end

  def expand_window
    print_centered("Please expand the terminal window")
    set_margin
    loop do
      @@rows, @@columns = IO.console.winsize
      break if @@rows >= 50 && @@columns >= 100
    end
    clear
  end

  def set_margin
    $stdout.write "#{CSI}#{@@columns / 2}C"
  end
end

class Image
  include Printable

  def initialize(filename)
    @lines = []
    File.foreach(filename) { |line| @lines << line.chomp }
  end

  def render
    lines.each { |line| print_centered(line) }
  end

  private

  attr_reader :lines
end

class Game
  include Printable

  attr_reader :player_name

  def initialize
    clear
    expand_window if window_too_small?
  end

  def play
    ready
    display_welcome
    player_name
    loop do
      ask_question
      break
    end
  end

  def ready
    answer = nil
    print_centered("Are you ready to play? (y/n)")
    set_margin
    loop do
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      print_centered("Please enter y or n")
      set_margin
    end
    clear
  end

  def display_welcome
    Image.new('images/castle.txt').render
  end

  def player_name
    answer = nil
    print_centered("What is your name, hero?")
    set_margin
    loop do
      answer = gets.chomp
      break unless answer.empty?
      print_centered("Please enter a name")
      set_margin
    end
    clear
  end

  def ask_question
    Image.new('images/gargoyle.txt').render
    print_centered("NOW HERO, YOU MUST ANSWER MY QUESTION")
  end
end

Game.new.play
