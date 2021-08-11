require_relative 'printable.rb'

class Villains
  VILLAINS = [
    "assassin", "bandit", "basilisk", "berserker", "bigfoot", "blob", "chimera",
    "chupacabra", "cthulhu", "demon", "dragon", "executioner", "frankenstein",
    "gargoyle", "ghosts", "ghoul", "giant", "giant_rat", "giant_spider",
    "goblin", "godzilla", "golem", "green_hag", "harpy", "hobgoblin", "hydra",
    "king_kong", "kraken", "loch_ness", "mage", "manticore", "medusa",
    "minotaur", "mummy", "ogre", "orc", "skeleton", "specter", "succubus",
    "troll", "vampire", "werewolf", "witch", "wyrmling", "zombie"]

  def initialize
    @villains = []
  end

  def populate
    VILLAINS.each do |name|
      img_file = "images/#{name}.txt"
      villains << Image.new(img_file)
    end

    #villains.shuffle!
  end

  def display!
    villains.pop.render
  end

  def each(&block)
    villains(&block)
  end

  def amount
    villains.size
  end

  #private

  attr_reader :villains
end

class Image
  include Printable

  def initialize(filename)
    @lines = []
    File.foreach(filename) { |line| @lines << line.chomp }
  end

  def render
    make_lines_equal!
    lines.each { |line| print_centered(line) }
  end

  private

  attr_reader :lines

  def make_lines_equal!
    max_size = lines.max_by(&:size).size
    lines.map! do |line|
      line.ljust(max_size)
    end
  end
end

a = Villains.new
a.populate
a.villains.each do |v|
  system('clear')
  v.render
  sleep(4)
end
