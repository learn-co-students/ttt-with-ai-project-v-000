class GameController

  def initialize
    puts "Welcome to CLI Tic-Tac-Toe!"
    menu
  end

  def menu
    puts "Type the number of the mode would you like to play:"
    puts "1. Player vs. Computer"
    puts "2. Player vs. Player"
    puts "3. Computer vs. Computer"
    puts "4. Wargames! See the average wins of 100 Computer vs. Computer games"

    game_type = gets.chomp
    case game_type
      when "1"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      when "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      when "3"
        Game.new(Players::Computer.new("O"), Players::Computer.new('0'), Board.new)
      when "4"
        #where should the logic for the repeating and reporting go?
        #make method for wargames!
      else
        puts "Please select 1-4 to start a new game"
        menu
    end
  end

end
