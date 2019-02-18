require_relative "../player.rb"

module Players



  class Computer < Player

    def random_number
      cells = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      cells.sample
    end

    def move(board)
      cell = self.random_number
      index = cell.to_i - 1
      unless board.taken?(index)
        cell
      end
    end









  end




end
