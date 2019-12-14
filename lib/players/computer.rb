module Players
  class Computer < Player
    attr_accessor :winning_space, :board

    # WIN_COMBINATIONS = [
    #   [0,1,2], [0,3,6], [0,4,8],
    #   [3,4,5], [6,4,2], [6,7,8],
    #   [2,5,8], [1,4,7]
    # ]
    def move(board)
      @board = board
      if possible_win?
        @winning_space
      else
        random_move = ((rand*9).floor+1).to_s
        if board.valid_move?(random_move)
          random_move
        end
      end
    end

    def possible_win?
      Game::WIN_COMBINATIONS.find do |wincombo|
        can_win = false
        actual_data = [board.cells[wincombo[0]], board.cells[wincombo[1]], board.cells[wincombo[2]]]
        if ((wincombo.collect{|cell| board.cells[cell] == self.token}.length == 2) &&
          (actual_data.include?(" ")))
          can_win = true
          @winning_space = wincombo.find{ |cell| board.cell[cell] == ' '}
        end
        can_win
      end
    end
  end
end

# rand*9.floor+1

# board.WIN_COMBINATIONS




  # WIN_COMBINATIONS.find do |wincombo|
  #   (board.cells[wincombo[0]] == board.cells[wincombo[1]] ||
  #   board.cells[wincombo[1]] == board.cells[wincombo[2]] ||
  #   board.cells[wincombo[0]] == board.cells[wincombo[2]]) &&
  #   (board.cells[wincombo[0]] == current_player.token ||
  #   board.cells[wincombo[1]] == current_player.token)
  #
  # end
