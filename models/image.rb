require_relative 'printable.rb'

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
