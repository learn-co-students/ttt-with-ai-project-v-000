
class Greeting 

  puts "Welcome! Please select what game version you would like to play."
  puts "If you would like to play computer vs. computer, please enter 0"
  puts "If you would like to play human vs. computer, please enter 1"
  puts "If you would like to play human vs. human, please enter 2"
  
  game_choice = gets.strip

  def game_type(game_choice)  
    case game_choice
      when 0 
      
      when 1 
        
      when 2 
        Game.new.play
      else 
        puts "You entered an error. Please put in a valid response."
        Greeting.new
      end
  end 



end 