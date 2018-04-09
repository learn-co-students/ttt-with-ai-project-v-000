module Players

  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

    def move(board)
      if self.token == "X"
        other_player = "O"
      else
        other_player = "X"
      end
      #defines first move if computer is Player 1
      if board.cells.all? {|cell| cell == " "}
        "5"
      #defines first move if computer is Player 2
      elsif board.cells.count(" ") == 8
        if board.position(1) != other_player
          "1"
        else
          "5"
        end
      #defines computer's second move

      elsif board.cells.count(" ") < 8
        examined_row = []
        WIN_COMBINATIONS.each do |win_combination|

          win_combination.each do |board_position|
            examined_row << board.cells[board_position]
          end

          if examined_row.include?(self.token) && !examined_row.include?(other_player)
            empty_cell = examined_row.index(" ")
            "#{[win_combination[empty_cell]]}"
            break
          else
            examined_row.clear
          end
       end
     end
   end

  end
end
