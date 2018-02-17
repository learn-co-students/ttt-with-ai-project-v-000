module Players

  class Computer < Player
    WIN_COMBINATIONS = [
      [2,5,8],
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [0,4,8],
      [6,4,2]]

    def move(board)
      opponent = "O" if self.token == "X"
      opponent = "X" if self.token == "O"

      puts "#{self.name} as #{self.token} is moving."
                                         # stage 0 random valid move
                                         # stage 1 simplest computer strategy is move in this order: the center, one of the four corners, one of the four sides
                                         # stage 1.5 play opposite corner
                                         # stage 2 check for possible winning conditions first
                                         # stage 3 advanced
                                         # Rule 1: If I have a winning move, take it.
                                         # Rule 2: If the opponent has a winning move, block it.
                                         # Rule 3: If I can create a fork (two winning ways) after this move, do it.
                                         # Rule 4: Do not let the opponent creating a fork after my move. (Opponent may block your winning move and create a fork.)
                                         # Rule 5: Place in the position such as I may win in the most number of possible ways.

                                         # Win: If the player has two in a row, they can place a third to get three in a row.
                                         # Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
                                         # Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
                                         # Blocking an opponent's fork:
                                         # Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has two opposite corners and "O" has the center, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
                                         # Option 2: If there is a configuration where the opponent can fork, the player should block that fork.



      # winning_move(board, self.token)  #work on advanced later
      center_move(board) ||
      corner_move(board, opponent) ||
      side_move(board)
    end

    def center_move(board)
      "5" if board.valid_move?("5")
    end

    def corner_move(board, opponent)
      if board.cells[0] == opponent && board.valid_move?("9")              # Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
        "9"
      elsif board.cells[2] == opponent && board.valid_move?("7")
        "7"
      elsif board.cells[6] == opponent && board.valid_move?("3")
        "3"
      elsif board.cells[8] == opponent && board.valid_move?("1")
        "1"
      else
        ["1", "3", "7", "9"].select{|move| board.valid_move?(move)}.sample  # Empty corner: The player plays in a corner square.
      end
    end

    def side_move(board)
      ["2", "4" ,"6", "8"].select{|move| board.valid_move?(move)}.sample
    end

    def winning_move(board, player_token)
      board_cells = board.cells
       ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect do |move|
         if board.valid_move?(move)
           board_cells[move.to_i-1] = player_token

           win = WIN_COMBINATIONS.detect do |combo|
            board_cells[combo[0]] ==board_cells[combo[1]] &&
            board_cells[combo[1]] ==board_cells[combo[2]]
           end

           win.size > 0
         end
       end
    end

  end
end
