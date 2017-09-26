require_relative '../player.rb'
require 'pry'
module Players
  class Computer < Player


    def move(board)
      take_middle(board)
      take_corner(board)
      take_random(board)
      #blocking(board)
      #winning(board)
    end

    def winning(board)
      Game::WIN_COMBINATIONS.each do |combo|
        position_1 = board.cells[combo[0]]
        position_2 = board.cells[combo[1]]
        position_3 = board.cells[combo[2]]
        if position_2 == position_3 && position_1 == " " && position_2 == self.token
          return (combo[0] + 1).to_s
        elsif position_3 == position_1 && position_2 == " " && position_3 == self.token
          return (combo[1] + 1).to_s
        elsif position_1 == position_2 && position_3 == " " && position_1 == self.token
          return (combo[2] + 1).to_s
        else
          nil
        end
      end
    end

    def blocking(board)
      Game::WIN_COMBINATIONS.each do |combo|
        position_1 = board.cells[combo[0]]
        position_2 = board.cells[combo[1]]
        position_3 = board.cells[combo[2]]

        if position_2 == position_3 && position_1 == " " && position_2 != self.token
          return (combo[0] + 1).to_s
        elsif position_3 == position_1 && position_2 == " " && position_3 != self.token
          return (combo[1] + 1).to_s
        elsif position_1 == position_2 && position_3 == " " && position_1 != self.token
          return (combo[2] + 1).to_s
        else
          nil
        end
      end
    end

    def take_middle(board)
      if board.cells[4] == " "
        return "5"
      else
        nil
      end
    end

    def take_corner(board)
      corner = [0,2,6,8].sample
      if board.cells[corner] == " "
        return (corner + 1).to_s
      else
        nil
      end
    end

    def take_random(board)
      random = [1,3,5,7].sample
      if board.cells[random] == " "
        return (random + 1).to_s
      else
        nil
      end
    end

  end
end
