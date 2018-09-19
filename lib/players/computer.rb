module Players

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  ORDER = [5, 1, 3, 7, 9, 2, 4, 6, 8]

  class Computer < Player

    def test_opp_gap(board)
      test = WIN_COMBINATIONS.find {|combo| !board.cells[combo[0]] == self.token && !board.cells[combo[2]] == self.token && board.taken?(combo[0]) && board.taken?(combo[2]) && !board.taken?(combo[1])}
      test ? test[1].to_s : false
    end

    def test_own_gap(board)
      test = WIN_COMBINATIONS.find {|combo| board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token && !board.taken?(combo[1])}
      test ? test[1].to_s : false
    end

    def apply_counter(board)
      test = ORDER.find {|cell| !board.taken?(cell)}
      test ? test.to_s : false
    end

    def empty?(board)
      if board.cells.any? {|x| x != " "}
        return false
      else
        return true
      end
    end

    def move(board)
      if empty?(board)
        return rand(1..9).to_s
      elsif test_opp_gap(board)
        return test_opp_gap(board)
      elsif test_own_gap(board)
        return test_own_gap(board)
      else
        return apply_counter(board)
      end
    end

  end

end
