module Players
  class Computer < Player
    def move(board)
      move = nil
      input = rand(1..9).to_s

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1 && !board.taken?(1)
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|poss_m| !board.taken?(poss_m)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7)) && !board.taken?(2)
        move = "2"
      else
        board.valid_move?(input)
          move = input
      end
      move
    end
    # to block:
    # check if there are any two positions that are taken with the same opposing token that is
    # lands in the win_combinations and block the third position that has not yet been
    # taken in the winning combination
  end
end
