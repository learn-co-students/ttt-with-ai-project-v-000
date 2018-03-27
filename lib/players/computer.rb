class Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [6,4,2]]

    def best_move(board)
      WIN_COMINATIONS.each do |combo|
        # Sees if two cells of winning combination matches player token and third is empty
        if board.cells[combo[0]] == player.token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          combo[2]
        elsif
          board.cells[combo[0]] == player.token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          combo[1]
        elsif
          board.cells[combo[1]] == player.token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          combo[0]
        # Sees if opponent has two of three spots in winning combination and blocks.
        elsif board.cells[combo[0]] != player.token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          combo[2]
        elsif
          board.cells[combo[0]] != player.token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          combo[1]
        elsif
          board.cells[combo[1]] != player.token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          combo[0]
        end
      end
    end

    def move(board)
      if winning_move(board) > 0 ? winning_move(board) : random_move(board)
    end

    def random_move(board)
      ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end
  end

end
