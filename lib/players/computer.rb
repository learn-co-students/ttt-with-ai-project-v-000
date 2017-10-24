require_relative "../player.rb"
require 'pry'

module Players
  class Computer < Player

    # Defining WIN_COMBINATIONS constant
    WIN_COMBINATIONS = [
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right column
      [0,4,8], # diagonal 1
      [2,4,6] # diagonal 2
    ]

    #Board Move
    def move(board)
      final_move = nil
      while final_move == nil
        if win_two_in_row(board) != nil
          final_move = win_two_in_row(board)
        elsif block_two_in_row(board) != nil
          final_move = block_two_in_row(board)
        elsif center(board) != nil
          final_move = center(board)
        elsif corner(board) != nil
          final_move = corner(board)
        else
          final_move = sides(board)
        end
      end
      final_move.to_s
    end

    #Define a method to win two in a row along current player's winning combinations
    def win_two_in_row(board)
      next_move = nil
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = board.cells[win_combination[0]] # load the value of the board at win_combination_1
        position_2 = board.cells[win_combination[1]] # load the value of the board at win_combination_2
        position_3 = board.cells[win_combination[2]] # load the value of the board at win_combination_3
        if (position_1 == self.token && position_2 == self.token && position_3 == " ")
          next_move = win_combination[2].to_i+1
        elsif (position_1 == self.token && position_2 == " " && position_3 == self.token)
          next_move = win_combination[1].to_i+1
        elsif (position_1 == " " && position_2 == self.token && position_3 == self.token)
          next_move = win_combination[0].to_i+1
        end
      end
      next_move
    end

    #Define a method to only block two in a row along other player's winning combinations
    def block_two_in_row(board)
      next_move = nil
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = board.cells[win_combination[0]] # load the value of the board at win_combination_1
        position_2 = board.cells[win_combination[1]] # load the value of the board at win_combination_2
        position_3 = board.cells[win_combination[2]] # load the value of the board at win_combination_3
        if (position_1 != self.token && position_1 != " " && position_1 == position_2 && position_3 == " ")
          next_move = win_combination[2].to_i+1
        elsif (position_1 != self.token && position_1 != " " && position_1 == position_3 && position_2 == " ")
          next_move = win_combination[1].to_i+1
        elsif (position_2 != self.token && position_2 != " " && position_2 == position_3 && position_1 == " ")
          next_move = win_combination[0].to_i+1
        end
      end
      next_move
    end

    #Define a method to take the center position if empty
    def center(board)
      !board.taken?(5) ? 5 : nil
    end

    #Define a method to take the corner position opposite to a preoccupied opponent's corner position
    #Or just take any empty corner
    def corner(board)
      corner_move = nil
      if board.position(1) != self.token && !board.taken?(9)
        corner_move = 9
      elsif board.position(3) != self.token && !board.taken?(7)
        corner_move = 7
      elsif board.position(7) != self.token && !board.taken?(3)
        corner_move = 3
      elsif board.position(9) != self.token && !board.taken?(1)
        corner_move = 1
      else
        corner_move = [1, 3, 7, 9].shuffle.find {|x| !board.taken?(x)}
      end
      corner_move
    end

    #Define a method to take any side position that is empty
    def sides(board)
      side_move = nil
      until !board.taken?(side_move)
        side_move = [2, 4, 6, 8].sample
      end
      side_move
    end

    ##Define a method to take any random position that is empty
    ##This method is currently not being used and only for future reference purposes
    #def random(board)
    #  random_move = nil
    #  until !board.taken?(random_move)
    #    random_move = Random.new.rand(1..9)
    #  end
    #  random_move
    #end

  end
end
