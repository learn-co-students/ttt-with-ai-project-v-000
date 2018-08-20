module Players

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  ORDER = [5, 1, 3, 7, 9, 2, 4, 6, 8]

  class Computer < Player

    def move(board)
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token
          return combo[1].to_s + 2
        end
      end
      ORDER.each do |cell|
        if !board.taken?(cell)
          return cell.to_s
        end
      end
    end
  end
end
