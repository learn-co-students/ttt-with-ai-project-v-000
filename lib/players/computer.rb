require_relative '../player.rb'
require 'pry'
module Players
  class Computer < Player


    def move(board)
      if winning(board)
        return winning(board)
      elsif blocking(board)
        return blocking(board)
      elsif middle = is_middle_free?(board)
        return middle
      elsif free_corner = are_corners_free?(board)
        return free_corner
      else
        return (1..9).to_a.sample
      end

    end

    def winning(board)
      Game::WIN_COMBINATIONS.each do |combo|
        position_1 = board.cells[combo[0]]
        position_2 = board.cells[combo[1]]
        position_3 = board.cells[combo[2]]
        if position_2 == position_3 && position_1 == " " && position_2 == self.token
          return (combo[0] + 1)
        elsif position_3 == position_1 && position_2 == " " && position_3 == self.token
          return (combo[1] + 1)
        elsif position_1 == position_2 && position_3 == " " && position_1 == self.token
          return (combo[2] + 1)
        end
      end
      nil
    end

    def blocking(board)
      Game::WIN_COMBINATIONS.each do |combo|
        position_1 = board.cells[combo[0]]
        position_2 = board.cells[combo[1]]
        position_3 = board.cells[combo[2]]

        if position_2 == position_3 && position_2 != " " && position_1 == " " && position_2 != self.token
          return (combo[0] + 1)
        elsif position_3 == position_1 && position_3 != " " && position_2 == " " && position_3 != self.token
          return (combo[1] + 1)
        elsif position_1 == position_2 && position_1 != " " && position_3 == " " && position_1 != self.token
          return (combo[2] + 1)
        end
      end
      nil
    end

    def is_middle_free?(board)
      return 5 if board.cells[4] == " "
    end

    def are_corners_free?(board)
      corners = [0,2,6,8]
      corners.each do |corner|
        return corner + 1 if board.cells[corner] == " "
      end
      nil
    end

  end
end
