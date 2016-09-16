module Players
  class Computer < Player

    def move(board)
    move = nil

    Game::WIN_COMBINATIONS.detect do |win_combos|
      if win_combos.select{|i| board.position(i) == token}.size == 2 && win_combos.any?{|i| board.position(i) == " "}
            move = win_combos.select{|i| !board.taken?(i)}.first

      elsif win_combos.select{|i| board.position(i) != " " && board.position(i) != token}.size == 2 && win_combos.any?{|i| board.position(i) == " "}
            move = win_combos.select{|i| !board.taken?(i)}.first
      end
    end

    move = [0, 2, 6, 8, 1, 3, 5, 7].detect{|i| !board.taken?(i)} if move == nil
    move
    end

  end
end
