=begin
    crear jugador
=end
require_relative "question"

puts "Enter your name:"
print "> "
name = gets.chomp
puts 
qs = Question.new
questions = qs.q_array
player = Player.new(name)

puts "Welcome #{player.name} to Reto 5!"
puts
puts "Instructions:"
puts
txt = File.open("instructions.txt")
puts txt.read()
puts
print "Type 'yes' to start playing: "

input = gets.chomp

if input == 'yes' or input == 'y'
    puts
    puts 'Preguntas:'
    puts

    questions.shuffle!
    questions.each_with_index do |question, index|
        puts "Pregunta #{index + 1}"
        puts

        try = 2
        flag = 0
            while flag == 0 and try >= 0
                puts "#{question[:question]}"
                answer = question[:answer]
                puts "Enter your answer:"
                print "> "
                prompt = gets.chomp
                puts
                if prompt == 'exit'
                    flag = 2
                elsif prompt == answer
                    puts "Way to go!"
                    puts
                    player.score_increase 
                    flag = 1
                else
                    if try == 0
                        puts "What a shame :'("
                        puts
                    else    
                        puts "You have #{try} tries left!"
                        puts
                    end
                    try -= 1
                end   
            end
            if flag == 2
                puts "Thanks!"
                break
            end    
    end
    puts "#{player.name} this is your final score #{player.score}!"
else
    puts
    puts "See you soon #{player.name}!"            
end        


    
    
