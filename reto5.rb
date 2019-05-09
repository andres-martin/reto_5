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
puts
txt = File.open("instructions.txt")
puts txt.read()
puts
print "Type 'yes' to start playing: "

input = gets.chomp.downcase

if input == 'yes' or input == 'y'
    puts
    puts 'Preguntas:'
    puts
    
    questions.shuffle!
    questions[0..4].each_with_index do |question, index|
        puts "Pregunta #{index + 1}"
        puts
        
	try = 2
        flag = 0
            while (flag == 0 and try >= 0)
                puts "#{question[:question]}"
                answer = question[:answer]
                puts "Enter your answer:"
                print "> "
                prompt = gets.chomp.downcase #normalize prompt to match upper and lower sequence of characters
                puts
                if prompt == 'exit'
                    flag = 2
                elsif prompt == answer.downcase ## normalize answer
                    puts "Way to go!"
                    puts
                    if answer.match Regexp.union(qs.power_ups)
                        player.score_increase(80)
                    else
                        player.score_increase
                    end        
                    flag = 1
                else
                    if try == 0
                        puts "What a shame :("
                        puts
                    else 
                        puts "Wrong!, try again"
                        puts "You have #{try} tries left.." if try > 1
                        puts "You have #{try} try left.." if try == 1
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


    
    
