class Question
  @@questions = []
  attr_accessor :code_snippet, :output, :answer, :description

  def initialize(cs, o, a, d)
    @code_snippet = cs
    @output = o
    @answer = a
    @description = d
  end

  def self.all
    @@questions
  end

  def self.import
    require 'csv'
    file = File.read('questions.csv')
    csv = CSV.parse(file, :headers => true, :encoding => 'ISO-8859-1')
      csv.each do |row|
        cs = row['Code Snippet']
        o = row['Output']
        a = row['Answer']
        d = row['Description']

        q = Question.new(cs, o, a, d)
        @@questions << q
      end
  end

  def to_s
    puts "DESCRIPTION: \n \n #{@description}"
    puts '========================'
    puts "CODE SNIPPET: \n \n #{@code_snippet}"
    puts '========================'
    puts "CODE SNIPPET: \n \n #{@output}"
  end

  def correct_answer?(input)
    answer.include?(input)
  end
end