require_relative 'printable'
require_relative 'image'

class Villains
  # instead of hard coding this should we import names from yaml file?
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
      img_file = "../content/images/#{name}.txt"
      villains << Image.new(img_file)
    end

    villains.shuffle!
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

  private

  attr_reader :villains
end
