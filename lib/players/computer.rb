require 'pry'
module Players
  class Computer < Player
    VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)


      #  VALID_MOVES.detect{|move| board.valid_move?(move)}



        if two_diagonal?(board)
          two_diagonal?(board)
        elsif two_vertical?(board)
          two_vertical?(board)
        elsif two_horizontal?(board)
          two_horizontal?(board)
        elsif middle?(board)
          middle?(board)
        elsif corners(board)
          corners(board)
        # elsif random_move(board)
        #   random_move(board)

        end



    end

    def middle?(board)
      if board.position(5) == " "
        VALID_MOVES[5-1]
      end
    end

    def corners(board)
      if board.position(1) == " " || board.position(3) == " " || board.position(7) == " " || board.position(9) == " "
        VALID_MOVES.select{|move|
          move = move.to_i
          move == 1 || move == 3 || move == 7 || move == 9
        }.sample
      end
    end

    def random_move(board)
      VALID_MOVES.select{|move| move }.sample
    end



    def two_diagonal?(board)
      moves = VALID_MOVES.select{|move|
        move = move.to_i
        move == 1|| move == 3 || move == 7 || move == 5 || move == 9
    }
      moves.detect{|move|

        if board.position(5) == "X" && board.position(9) == "X" || board.position(5) == "O" && board.position(9) == "O"
          move == "1" unless board.position(1) != " "
        elsif board.position(5) == "X" && board.position(7) == "X" || board.position(5) == "O" && board.position(7) == "O"
          move == "3" unless board.position(3) != " "
        elsif board.position(5) == "X" && board.position(3) == "X" || board.position(5) == "O" && board.position(3) == "O"
          move == "7" unless board.position(7) != " "
        elsif board.position(1) == "X" && board.position(9) == "X" || board.position(1) == "O" && board.position(9) == "O"
          move == "5" unless board.position(5) != " "
        elsif board.position(3) == "X" && board.position(7) == "X" || board.position(3) == "O" && board.position(7) == "O"
          move == "5" unless board.position(5) != " "
        elsif board.position(1) == "X" && board.position(5) == "X" || board.position(1) == "O" && board.position(5) == "O"
          move == "9" unless board.position(9) != " "
        else
          false
        end
      }




    end

    def two_vertical?(board)
      VALID_MOVES.detect{|move|
        if board.position(1) == "X" && board.position(4) == "X" || board.position(1) == "O" && board.position(4) == "O"
          move == "7" unless board.position(7) != " "
        elsif board.position(7) == "X" && board.position(4) == "X" || board.position(7) == "O" && board.position(4) == "O"
          move == "1" unless board.position(1) != " "
        elsif board.position(1) == "X" && board.position(7) == "X" || board.position(1) == "O" && board.position(7) == "O"
          move == "4" unless board.position(4) != " "
        elsif board.position(2) == "X" && board.position(5) == "X" || board.position(2) == "O" && board.position(5) == "O"
          move == "8" unless board.position(8) != " "
        elsif board.position(8) == "X" && board.position(5) == "X" || board.position(8) == "O" && board.position(5) == "O"
          move == "2" unless board.position(2) != " "
        elsif board.position(2) == "X" && board.position(8) == "X" || board.position(2) == "O" && board.position(8) == "O"
          move == "5" unless board.position(5) != " "
        elsif board.position(3) == "X" && board.position(6) == "X" || board.position(3) == "O" && board.position(6) == "O"
          move == "9" unless board.position(9) != " "
        elsif board.position(9) == "X" && board.position(6) == "X" || board.position(9) == "O" && board.position(6) == "O"
          move == "3" unless board.position(3) != " "
        elsif board.position(3) == "X" && board.position(9) == "X" || board.position(3) == "O" && board.position(9) == "O"
          move == "6" unless board.position(6) != " "
        else
          false
        end
      }

    end



    def two_horizontal?(board)
      VALID_MOVES.detect{|move|
        if board.position(1) == "X" && board.position(2) == "X" || board.position(1) == "O" && board.position(2) == "O"
          move == "3" unless board.position(3) != " "
        elsif board.position(3) == "X" && board.position(2) == "X" || board.position(3) == "O" && board.position(2) == "O"
          move == "1" unless board.position(1) != " "
        elsif board.position(1) == "X" && board.position(3) == "X" || board.position(1) == "O" && board.position(3) == "O"
          move == "2" unless board.position(2) != " "

        elsif board.position(4) == "X" && board.position(5) == "X" || board.position(4) == "O" && board.position(5) == "O"
          move == "6" unless board.position(6) != " "
        elsif board.position(6) == "X" && board.position(5) == "X" || board.position(6) == "O" && board.position(5) == "O"
          move == "4" unless board.position(4) != " "
        elsif board.position(4) == "X" && board.position(6) == "X" || board.position(4) == "O" && board.position(6) == "O"
          move == "5" unless board.position(5) != " "

        elsif board.position(7) == "X" && board.position(8) == "X" || board.position(7) == "O" && board.position(8) == "O"
          move == "9" unless board.position(9) != " "
        elsif board.position(9) == "X" && board.position(8) == "X" || board.position(9) == "O" && board.position(8) == "O"
          move == "7" unless board.position(7) != " "
        elsif board.position(7) == "X" && board.position(9) == "X" || board.position(7) == "O" && board.position(9) == "O"
          move == "8" unless board.position(8) != " "
        else
          false
        end
      }

    end





    # select iterator - returns an array of iterated elements based on true conditions
    # sample - returns a random element inside an array

  end

end
