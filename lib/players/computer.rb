module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [2,4,6], #diagonal up
      [0,4,8] #diagonal down
    ]

    def move(board)
      # binding.pry
      open_moves = board.cells.collect.with_index do |c, i|
          i + 1 if c == " "
          end.compact

      corner_move = [1, 3, 7, 9].select do |m|
        open_moves.include?(m)
      end

      strategy_1 = WIN_COMBINATIONS.find do |win|
        board.cells[win[0]] == board.cells[win[1]] && board.cells[win[2]] == " " && board.cells[win[0]] != " "
        end

      strategy_2 = WIN_COMBINATIONS.find do |win|
        board.cells[win[0]] == board.cells[win[2]] && board.cells[win[1]] == " " && board.cells[win[0]] != " "
        end

      strategy_3 = WIN_COMBINATIONS.find do |win|
        board.cells[win[1]] == board.cells[win[2]] && board.cells[win[0]] == " " && board.cells[win[1]] != " "
        end

      if open_moves.include?(5)
        "5"
      elsif
        strategy_1 != nil && open_moves.include?(strategy_1[2]+1)
        answer = strategy_1[2] + 1
        answer.to_s
      elsif
        strategy_2 != nil && open_moves.include?(strategy_2[1]+1)
        answer = strategy_2[1] + 1
        answer.to_s
      elsif
        strategy_3 != nil && open_moves.include?(strategy_3[0]+1)
        answer = strategy_3[0] + 1
        answer.to_s
      elsif
        corner_move != []
        corner_move.sample.to_s
      else
        open_moves.sample.to_s
      end

    end

  end
end

#board.cells = ["X", "O", "X", " ", "X", "O", "O", "O", "X"]
