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
    print_centered("Please expand the terminal window ")
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

  def initialize
    @lines = []
  end

  def render
    lines.each { |line| print_centered(line) }
  end

  private

  attr_reader :lines
end

class Castle < Image
  def initialize
    @lines = [ "", "", "", "", "",
"   /\\                                                        /\\   ",
"  |  |                                                      |  |  ",
" /----\\               WELCOME TO CODE CASTLE               /----\\ ",
"[______]                                                  [______]",
" |    |         _____                        _____         |    | ",
" |[]  |        [     ]                      [     ]        |  []| ",
" |    |       [_______][ ][ ][ ][][ ][ ][ ][_______]       |    | ",
" |    [ ][ ][ ]|     |  ,----------------,  |     |[ ][ ][ ]    | ",
" |             |     |/'    ____..____    '\\|     |             | ",
"  \\  []        |     |    /'    ||    '\\    |     |        []  /  ",
"   |      []   |     |   |o     ||     o|   |     |  []       |   ",
"   |           |  _  |   |     _||_     |   |  _  |           |   ",
"   |   []      | (_) |   |    (_||_)    |   | (_) |       []  |   ",
"   |           |     |   |     (||)     |   |     |           |   ",
"   |           |     |   |      ||      |   |     |           |   ",
" /''           |     |   |o     ||     o|   |     |           ''\\ ",
"[_____________[_______]--'------''------'--[_______]_____________]"
    ]
  end
end

class Game
  include Printable

  def initialize
    clear
    expand_window if window_too_small?
  end

  def play
    ready
    Castle.new.render
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
end

Game.new.play
