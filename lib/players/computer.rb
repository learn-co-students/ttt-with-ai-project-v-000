require 'pry'
module Players
  class Computer < Player
    attr_accessor :board

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]]

    def move(board)
      @board = board
      case
      # when first_move? == true
      #   input = 5
    # when counter_attack != nil
    #     input = counter_attack + 1
      when center
        input = 5
      when corner
        input = corner + 1
      else
        until !board.taken?(input)
          input = (1..9).to_a.sample
        end
      end
      input.to_s
    end

    def first_move?
      board.cells == []
    end

    def counter_attack # when player has 2 of 3 win combination, move to block
# binding.pry
      block_now = WIN_COMBINATIONS.detect do |win_com| #win_com is an array of indicies... make an array. iterate over win_com and .collect to be able to compare arrays
        # binding.pry
        (board.cells[win_com[0..2]] == ["X","X"," "] || board.cells[win_com[0..2]] == ["X"," ","X"] || board.cells[win_com[0..2]] == [" ","X","X"]) ||
         (board.cells[win_com[0..2]] == ["O","O"," "] || board.cells[win_com[0..2]] == ["O"," ","O"] || board.cells[win_com[0..2]] == [" ","O","O"])
      end
      if block_now != nil
        block_move = block_now.detect {|w_c_p| board.cells[w_c_p] == " "}
      end
      # block_move
    end

    def center # if empty, or first_move take center square unless counter_attack is needed
      board.cells[4] == " " || first_move?
    end

    def edge # if corner = false, move to any edge space
    end

    def corner # if center = false, move to any corner space
      corners = [0, 2, 6, 8]
      corners.detect {|corner| board.cells[corner] == " "}
    end







  end
end
