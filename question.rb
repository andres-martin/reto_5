class Player
    attr_accessor :name, :score

    def initialize(name)
        @name = name
        @score = 0
    end

    def score_increase
        @score += 50    
    end    
end   

class Question
    attr_reader :q_array

    def initialize
        @q_array = get_questions(q_array)
    end

    private
        def get_questions(q_array)
            q_array = []
            q_line = []
            File.open('questions.txt') do |f|
                f.each_line do |line|
                    q_line = line.chomp.split(';')
                    q_array << {question: q_line[0], answer: q_line[1]} 
                end       
            end 
            q_array
        end    
       
end    