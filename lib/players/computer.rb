require 'pry'

module Players

  class Computer < Player


    def defence(board)
      combos = [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
          ['1', '4', '7'],
          ['2', '5', '8'],
          ['3', '6', '9'],
          ['1', '5', '9'],
          ['3', '5', '7']
          ]

      index = ""
      if self.token == "X"
        enemy_token = "O"
      else
        enemy_token = "X"
      end
      combos.each do |c|
        if (board.cells[(c[0].to_i)-1] == enemy_token) && (board.cells[(c[1].to_i)-1] == enemy_token) && board.valid_move?(c[2])
            index = c[2]
        elsif (board.cells[(c[1].to_i)-1] == enemy_token) && (board.cells[(c[2].to_i)-1] == enemy_token) && board.valid_move?(c[0])
            index = c[0]
        elsif (board.cells[(c[0].to_i)-1] == enemy_token) && (board.cells[(c[2].to_i)-1] == enemy_token) && board.valid_move?(c[1])
            index = c[1]
        end
      end
      # binding.pry
      return index
    end


    def move(board)
      if board.valid_move?("5")
        index = "5"
        index
      elsif defence(board) != ""
        defence(board)
      else
        array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        index = array.sample
        index if board.valid_move?(index)
      end
    end

  end

end
