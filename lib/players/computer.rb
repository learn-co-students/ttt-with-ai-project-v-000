module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif occupied_spots(board).size + occupied_by_opponent(board).size == 1
        #pick a corner to defend
        [0,2,7,9].sample.to_s
      elsif occupied_spots(board).size >= 1
        #Offense: Try to find a winning combo
        Game::WIN_COMBINATIONS.each do |combo|
          options_to_win = combo - occupied_spots(board)
          if options_to_win.size == 1 && board.valid_move?((options_to_win[0]+1))
            return (options_to_win[0]+1).to_s
          end
        end
        #Can't find a winning combo. Play some defense
        if occupied_by_opponent(board).size >= 2
          Game::WIN_COMBINATIONS.each do |combo|
            options_to_defend = combo - occupied_by_opponent(board)
            if options_to_defend.size == 1 && board.valid_move?((options_to_defend[0]+1))
              return (options_to_defend[0]+1).to_s
            end
          end
        end
        (board.valid_cells.sample+1).to_s
      else
        (board.valid_cells.sample+1).to_s
      end
    end
  end
end
