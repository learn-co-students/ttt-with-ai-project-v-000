require "pry"
module Players


  class Human < Player

    # in your game, you will have a current player, current player could be a player object, or computer object.
    # if the computer object useres a board in order to make a move based on your conditions. You would need to pass the board in move
    # current_player.move(@board)
    # current_player.move
    def move(board)
      puts "What is your move in a position from 1 - 9:"
      gets.chomp
    end
  end

end
