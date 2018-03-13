require 'pry'

module Players
  class Computer < Player

#valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
binding.pry

      #   if !board.taken?("5")
      #    "5"
      #    binding.pry
      #  elsif board.taken?("5") == token
    # elsif board.taken?("5") && board.taken?("3")
    #      "7"
      #  elsif board.taken?("5") && board.taken?("7")
      #    "3"
      #  elsif board.taken?("5") && board.taken?("1")
      #    "9"

      #  else
      #    valid_moves.each {|move| board.valid_move?(move)}.sample
      #end
    end

  def corner(board)
    corners = [1, 5, 7, 9]
    corners.detect {|cell| board.valid_move?(cell)}
  end

  def random(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_moves.each {|move| board.valid_move?(move)}.sample
  end

  def block(board)

    valid_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    valid_moves.detect do |move|
      if !board.valid_move?(move)
        board.valid_move?(move + 1)
      end
    end
  end


  end
end
