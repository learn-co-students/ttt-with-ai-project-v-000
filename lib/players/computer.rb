module Players
  #Define a class `Players::Computer` that represents a computer player of Tic Tac Toe.
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  #  attr_accessor :board

    def move(board= nil)
#      WIN_COMBINATIONS.select do |wc|
#        if (board.cells[wc[0]] == board.cells[wc[1]]) && (board.cells[wc[0]] != board.cells[wc[2]])
#          return board.cells[wc[2]]
#        elsif (board.cells[wc[2]] == board.cells[wc[1]]) && (board.cells[wc[2]] != board.cells[wc[0]])
#          return board.cells[wc[0]]
#        elsif (board.cells[wc[0]] == board.cells[wc[2]]) && (board.cells[wc[0]] != board.cells[wc[1]])
#          return board.cells[wc[1]]
#        else
            moves = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
            moves.find do |move|
              board.taken?(move) == false
            end
#        end
#      end
    end
  end
end
