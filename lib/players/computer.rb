require 'pry'

module Players
  class Computer < Player


    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      board.valid_move?("5") ? "5" : other_moves(board)

    end

  def corner(board)
    corners = [1, 3, 7, 9]
    corners.detect {|cell| board.valid_move?(cell)}
  end

  def random(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_moves.each {|move| board.valid_move?(move)}.sample
  end

  def other_moves(board)
    corner(board) || random(board)
  end


  end
end
