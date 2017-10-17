
class TicTacToeCLI
  
  def initialize
  end

  def call
    print %x{clear}
puts " _____ _           _____               _____".colorize(:light_blue)       
puts "|_   _(_)         |_   _|             |_   _|".colorize(:light_blue)          
puts "  | |  _  ___ ______| | __ _  ___ ______| | ___   ___".colorize(:light_blue)  
puts "  | | | |/ __|______| |/ _` |/ __|______| |/ _ \\ / _ \\".colorize(:light_blue) 
puts "  | | | | (__       | | (_| | (__       | | (_) |  __/".colorize(:light_blue) 
puts "  \\_/ |_|\\___|      \\_/\\__,_|\\___|      \\_/\\___/ \\___|".colorize(:light_blue) 
    puts ""
    puts ""
    puts "  Welcome to Tic-Tac-Toe!"
    puts ""
    puts "  Would you like to play a 0, 1, or 2 player mode?"
    puts ""
    puts "  Enter 0, 1, or 2.".light_cyan
    input = gets.strip

    if input == "2"
      puts "Would you like to go first and be 'X'? Y/N"
      input = gets.strip
      if input.upcase == "Y"
        a_round = Game.new(Players::Human.new("X"), Players::Human.new("O"))
      elsif input.upcase == "N"
        a_round = Game.new(Players::Human.new("O"), Players::Human.new("X"))
      end
    elsif input =="1"
      puts "Would you like to go first and be 'X'? Y/N"
      input = gets.strip
      if input.upcase == "Y"
        a_round = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      elsif input.upcase == "N"
        a_round = Game.new(Players::Computer.new("O"), Players::Human.new("X"))
      end
    elsif input =="0"
      a_round = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    end

    a_round.board.display
    a_round.play

  end
end