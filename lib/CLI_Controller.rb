

class CliController

 def call
   input = ""

   until input == "exit"
     puts "Welcome to TIC TAC TOE Game"
     puts "Please choose one of GAME"
     puts "================================="
     puts "Computer vs Computer, enter '1'."
     puts "Computer vs Human, enter '2'."
     puts "Human vs Human, enter '3'"
     puts "================================="
     puts "To quit, enter 'exit'."
     puts "================================="
     puts "What would you like to do?"

     input = gets.strip
     case input
     when "1"
       two_computers
     when "2"
       one_computer
     when "3"
       two_humans
     end #case
 end#until
 end #call


  def two_computers
    puts " Two computers"
    computer1 = Players::Computer.new("X")
    computer2 = Players::Computer.new("O")
    Game.new(computer1, computer2).play

  end
  def one_computer
    puts " One computer and a Human"
    computer = Players::Computer.new("X")
    Game.new(computer).play

  end

  def two_humans
    puts " Two Humans"
    Game.new.play

  end
end
