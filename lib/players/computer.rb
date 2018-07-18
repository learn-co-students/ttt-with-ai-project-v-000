require 'pry'

module Players
  class Computer < Player

  #corners are 1 ,3, 7, 9
  #middles are 2, 4, 6, 8
  #players have tokens so how do I know which token I am?

#defines the same game over and over
    # def move(board)
    #
    #   if board.valid_move?("5")
    #     "5"
    #   elsif [1,3,7,9].find {|p| board.valid_move?(p)}
    #     [1,3,7,9].find {|p| board.valid_move?(p)}
    #   else
    #     [2,4,6,8].find {|p| board.valid_move?(p)}
    #   end
    # end

#defines a totally random game
    # def move(board)
    #   if !board.taken?("5")
    #     "5"
    #   else
    #     a = [1,2,3,4,6,7,8,9]
    #     b = a.sample
    #     until board.valid_move?(b)
    #       b = a.sample
    #     end
    #     b
    #   end
    # end

    def move(board)

      # WIN_COMBINATIONS = [[0,1,2],
      #                     [3,4,5],
      #                     [6,7,8],
      #                     [0,3,6],
      #                     [1,4,7],
      #                     [2,5,8],
      #                     [0,4,8],
      #                     [2,4,6]]
      #moves that need to be blocked
      block_move = Game::WIN_COMBINATIONS.find do |win_combo|
        (board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[2]] == " " && board.cells[win_combo[0]] != " ") ||
        (board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] != " ") ||
        (board.cells[win_combo[0]] == board.cells[win_combo[2]] && board.cells[win_combo[1]] == " " && board.cells[win_combo[0]] != " ")
      end
      #moves to try and gain a win
      make_move = Game::WIN_COMBINATIONS.select do |win_combo|
        (board.cells[win_combo[0]] == self.token && board.cells[win_combo[1]] == " " && board.cells[win_combo[2]] == " ") ||
        (board.cells[win_combo[1]] == self.token && board.cells[win_combo[0]] == " " && board.cells[win_combo[2]] == " ") ||
        (board.cells[win_combo[2]] == self.token && board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] == " ")
      end
  #    binding.pry

      if block_move != nil
         block_cell = block_move.find {|blank| board.cells[blank] == " "}
         block_cell+1
      elsif board.valid_move?("5")
        "5"
      elsif [1,3,7,9].any?{|c| board.valid_move?(c)}
        corners = [1,3,7,9].sample
        until board.valid_move?(corners)
           corners = [1,3,7,9].sample
        end
        corners
      elsif make_move != []
          move_cell = make_move.sample.select{|p| board.cells[p] == " "}
          move_cell.sample+1
      else
        a = [1,2,3,4,5,6,7,8,9]
        b = a.sample
        until board.valid_move?(b)
          b = a.sample
        end
        b
      end
    end



  end
end
