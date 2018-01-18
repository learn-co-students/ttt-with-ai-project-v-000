####Players::Computer                                                                                                                                                     
  #inherits from Player                                                                                                                                                
  #####move                                                                                                                                                               
    #returns a valid position for the computer to move

module Players
  class Computer < Player
    GAME_INDEX = [1,2,3,4,5,6,7,8,9]
    def move (board)
      computer_input = nil
      #Game start: first move goes in the middle
      if board.cells.all?{|cell| cell == " "}
        computer_input = 5
      else
        #move 3rd or more > look if there are two tokens of the same player in the WIN_COMBINATIONS
        Game::WIN_COMBINATIONS.detect do |win_combo|
          if (board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
            board.cells[win_combo[0]] != " " &&
            board.cells[win_combo[2]] == " ")
            computer_input = win_combo[2]+1
            #puts "1st if #{computer_input}"
          elsif (board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
            board.cells[win_combo[1]] != " " &&
            board.cells[win_combo[0]] == " ")
            computer_input = win_combo[0]+1
          elsif (board.cells[win_combo[0]] == board.cells[win_combo[2]] &&
            board.cells[win_combo[0]] != " " &&
            board.cells[win_combo[1]] == " ")
            computer_input = win_combo[1]+1
          end
        end
        # if it's not the game start and no 2 tokens were found in a win_combo > Second move
        # pick one randomly from GAME_INDEX
        if !computer_input
          computer_input = GAME_INDEX.sample
        end
      end
      computer_input.to_s
    end
  end
end