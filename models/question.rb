class Question
  @@questions = []
  attr_accessor :code_snippet, :output, :return_value, :answer, :description

  def initialize(cs, o, rv, a, d)
    @code_snippet = cs
    @output = o
    @return_value = rv
    @answer = a
    @description = d
  end

  def self.all
    @@questions
  end

  def self.import
    require 'csv'
    file = File.read(Dir.glob('../content/*.csv').first)
    csv = CSV.parse(file, :headers => true, :encoding => 'ISO-8859-1')
      csv.each do |row|
        cs = row['Code Snippet']
        o = row['Output']
        rv = row['Return Value']
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
    puts "OUTPUT: \n \n #{@output}"
    puts '========================'
    puts "Return Value: \n \n #{@return_value}"
  end

  def correct_answer?(input)
    answer.include?(input)
  end
end
