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

    def two_of_three(board) #if youve taken 2 of 3 winning cells, take the third
      input = nil
      WIN_COMBINATIONS.detect do |win|
        if board.cells[win[0]] == @token && board.cells[win[1]] == @token && !board.taken?("#{win[2] +1}")
          input = "#{win[2] + 1}"
        elsif board.cells[win[0]] == @token && board.cells[win[2]] == @token && !board.taken?("#{win[1] +1}")
          input = "#{win[1] + 1}"
        elsif board.cells[win[1]] == @token && board.cells[win[2]] == @token && !board.taken?("#{win[0] +1}")
          input = "#{win[0] + 1}"
        end
      end
      input
    end

    def opponent_two_of_three(board) #if your opponent has taken 2 of 3 winning cells, block them
      opponent_token = (@token == "X" ? "O" : "X")
      input = nil
      WIN_COMBINATIONS.detect do |win|
        if board.cells[win[0]] == opponent_token && board.cells[win[1]] == opponent_token && !board.taken?("#{win[2] +1}")
          input = "#{win[2] + 1}"
        elsif board.cells[win[0]] == opponent_token && board.cells[win[2]] == opponent_token && !board.taken?("#{win[1] +1}")
          input = "#{win[1] + 1}"
        elsif board.cells[win[1]] == opponent_token && board.cells[win[2]] == opponent_token && !board.taken?("#{win[0] +1}")
          input = "#{win[0] + 1}"
        end
      end
      input
    end

    def last_moves(board)
      if !board.taken?("2")
        input = "2"
      elsif !board.taken?("4")
        input = "4"
      elsif !board.taken?("6")
        input = "6"
      elsif !board.taken?("8")
        input = "8"
      end
    end

    def move(board) #if the center isn't taken, take it
      if !board.taken?("5")
        input = "5"
      elsif two_of_three(board)
        two_of_three(board)
      elsif opponent_two_of_three(board)
        opponent_two_of_three(board)
      elsif !board.taken?("1") #if a corner is available, take it
        input = "1"
      elsif !board.taken?("3")
        input = "3"
      elsif !board.taken?("7")
        input = "7"
      elsif !board.taken?("9")
        input = "9"
      else
        last_moves(board)
      end #if loop ends=begin

    end #move method ends

  end #Class Computer ends

end #Players module ends
