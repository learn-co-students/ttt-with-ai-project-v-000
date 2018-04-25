require 'pry'

module Players

  class Computer < Player
    #attr_accessor :game, :board

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      #returns a random value from an array as the new move
      new_move = valid_moves.sample
      #if new_move not occupied on board, play as computer move
      #check if computer is winner.
      #if not let person or other computer play.
      #if WIN_COMBINATIONS.detect do |combo|
        #board[combo[0]] == board[combo[1]] &&
        #board[combo[1]] == board[combo[2]] &&
        #board.taken?(combo[0]+1)
        #puts "#{self} is winner."
      #end
    #end
    end
  end

end
