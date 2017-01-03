module Players
  class Computer < Player
    def move(board)
      current_move = nil
      if !board.taken?(5)
        current_move = "5"
      elsif board.turn_count == 1
        current_move = "1"
      elsif board.turn_count == 2
        current_move = [1, 3, 7, 9].find{|i| !board.taken?(i)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        current_move = "2"
      else
        possibilities = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        current_move = possibilities.find{|i| !board.taken?(i)}
      end
      current_move
    end
  end
end
