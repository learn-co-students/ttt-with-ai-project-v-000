module Players

  class Computer < Player

  #     WIN_COMBINATIONS = [
  #   [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
  #   [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
  #   [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
  #   [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
  #   [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
  #   [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
  #   [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
  #   [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
  # ]

    def move(board)
      if !board.taken?("5")
        board = "5"
      elsif board.turn_count == 1
        board = "1"
      elsif board.turn_count == 2
        board = ["1", "3", "7", "9"].detect do |position|
          !board.taken?(position)
        end
      elsif board.turn_count > 2
        position = Game::WIN_COMBINATIONS.detect do |win_combo|
          (board.position(win_combo[0 + 1].to_s) != token && board.position(win_combo[0 + 1].to_s) != " ") && 
          (board.position(win_combo[1 + 1].to_s) != token && board.position(win_combo[1 + 1].to_s) != " ") ||
          (board.position(win_combo[0 + 1].to_s) != token && board.position(win_combo[0 + 1].to_s) != " ") && 
          (board.position(win_combo[2 + 1].to_s) != token && board.position(win_combo[2 + 1].to_s) != " ") ||
          (board.position(win_combo[2 + 1].to_s) != token && board.position(win_combo[2 + 1].to_s) != " ") && 
          (board.position(win_combo[1 + 1].to_s) != token && board.position(win_combo[1 + 1].to_s) != " ")
        end.detect do |index|
          !board.taken?((index + 1).to_s)
        end + 1
        board = position.to_s
      end

    end
  end
end
