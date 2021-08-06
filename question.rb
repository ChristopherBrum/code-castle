class Question
  @@questions = []

  attr_accessor :code_snippet, :output, :answer, :description

  def initialize(cs, o, a, d)
    @code_snippet = cs
    @output = o
    @answer = a
    @description = d
    @@questions << self
  end

  def self.all
    @@questions
  end
end


x = Question.new("hello", "hello", "hello", "hello")
y = Question.new("hello", "hello", "hello", "hello")

Question.all.each{|q| p q}