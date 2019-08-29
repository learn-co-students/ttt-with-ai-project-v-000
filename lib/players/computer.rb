module Players
  class Computer < Player
    def move(board)
      if board.turn_count == 0
        return ["1", "3", "5", "7", "9"].sample
      elsif board.turn_count == 1
        if board.taken?("5")
          return ["1", "3", "7", "9"].sample
        else
          return "5"
        end
      else
        self.token == "X" ? enemy_token = "O" : enemy_token = "X"
        cells_and_situations = {
          "1" => [[1, 2], [3, 6], [4, 8]],
          "2" => [[0, 2], [4, 7]],
          "3" => [[0, 1], [4, 6], [5, 8]],
          "4" => [[0, 6], [4, 5]],
          "5" => [[0, 8], [1, 7], [2, 6], [3, 5]],
          "6" => [[2, 8], [3, 4]],
          "7" => [[0, 3], [2, 4], [7, 8]],
          "8" => [[1, 4], [6, 8]],
          "9" => [[0, 4], [2, 5], [6, 7]]
        }
        cells_and_situations.each do |cell, situations| # finishing winning situations
          if !board.taken?(cell)
            if situations.any? { |situation| situation.all? { |index| board.cells[index] == self.token } }
              return cell
            end
          end
        end
        cells_and_situations.each do |cell, situations| # blocking the enemy's winning situations
          if !board.taken?(cell)
            if situations.any? { |situation| situation.all? { |index| board.cells[index] == enemy_token } }
              return cell
            end
          end
        end
        ["2", "4", "6", "8"].each do |cell| # put on an edge
          if !board.taken?(cell)
            return cell
          end
        end
        ["5", "1", "3", "7", "9"].each do |cell| # put on a corner
          if !board.taken?(cell)
            return cell
          end
        end
      end
    end
  end
end
