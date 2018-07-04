#Greet the user with a message.
#Prompt the user for what kind of game they want to play, 0,1, or 2 player.
#Ask the user for who should go first and be "X".
#Use the input to correctly initialize a Game with the appropriate player types and token values.
#When the game is over, the CLI should prompt the user if they would like to play again and allow them to choose a new configuration for the game as described above. If the user doesn't want to play again, exit the program.
class CLI
  attr_accessor :game

  def start
    puts "Which type of game would you like to play, 0, 1 or 2 player?"
    input.gets.strip
    #if 0
      #@game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      #@game.turn
    #elsif 1
      #puts "Who should play first, Human or Computer?"
      #input.gets.strip
      #if input == "Human"
        #@game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        #@game.turn
      #else
        #@game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        #@game.turn
      #end
    #elsif 2
      #@game = Game.new
      #@game.turn
    #else
      #start
    #end

    #if @game.over == true
      #puts "Would you like to play again?"
      #input.gets.strip
      #if input == "yes"
        #start
      #else
        #exit
      #end
    #end
  end
end
