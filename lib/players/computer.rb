module Players
  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !baord.taken?(i)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == baord.position(7))
        move = "2"
      else
        WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[0])
      end

      end
    end
  end
end
