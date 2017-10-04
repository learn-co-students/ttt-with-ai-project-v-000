require 'pry'

module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2], #top row win
      [3, 4, 5], #middle row win
      [6, 7, 8], #bottom row win
      [0, 3, 6], #first column win
      [1, 4, 7], #second column win
      [2, 5, 8], #third column win
      [0, 4, 8], #first diagonal win
      [2, 4, 6] #second diagonal win
    ]

    def two_of_three(board)
      WIN_COMBINATIONS.detect do |win| #if youve taken 2 of 3 winning cells, take the third
        if board.cells[win[0]] == @token && board.cells[win[1]] == @token
          input = "#{win[2] + 1}"
        elsif board.cells[win[0]] == @token && board.cells[win[2]] == @token
          input = "#{win[1] + 1}"
        elsif board.cells[win[1]] == @token && board.cells[win[2]] == @token
          input = "#{win[0] + 1}"
        end
      end
    end

    def opponent_two_of_three(board)
      WIN_COMBINATIONS.detect do |win| #if your opponent has take 2 of 3 winning cells, block them
        #how do I code the other player's token?
        if board.cells[win[0]] == (!token && !" ") && board.cells[win[1]] == (!token && !" ")
          input = "#{win[2] + 1}"
        elsif board.cells[win[0]] == (!token && !" ") && board.cells[win[2]] == (!token && !" ")
          input = "#{win[1] + 1}"
        elsif board.cells[win[1]] == (!token && !" ") && board.cells[win[2]] == (!token && !" ")
          input = "#{win[0] + 1}"
        end
      end
    end

    def move(board)
      if !board.taken?("5") #if the center isn't taken, take it
        binding.pry
        input = "5"
      elsif two_of_three(board)
      elsif opponent_two_of_three(board)
      #if a corner is available, take it
      elsif !board.cells[0].taken?
          input = "1"
      elsif !board.cells[2].taken?
            input = "3"
      elsif !board.cells[6].taken?
              input = "7"
      elsif !board.cells[8].taken?
                input = "9"
      end #if loop ends

    end #move method ends

  end #Class Computer ends

end #Players module ends
