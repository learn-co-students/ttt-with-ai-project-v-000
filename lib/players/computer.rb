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
      puts "#{self.name} as #{self.token} is moving."

      best_move(board) ||
      #winning_move(board, self.token) ||  #work on advanced later
      #blocking_move(board, opponent.token) ||
      center_move(board) ||
      corner_move(board, opponent.token) ||
      side_move(board)
    end

    def opponent
      Player.all.detect {|player| player != self}
    end

    def center_move(board)
      puts "center move cleared"
      "5" if board.valid_move?("5")
    end

    def corner_move(board, opponent)
      puts "corner move cleared"
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
      puts "side move cleared"
      ["2", "4" ,"6", "8"].select{|move| board.valid_move?(move)}.sample
    end

    def winning_move(board, player_token)
      puts "winning move cleared"
       ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select{|move| board.valid_move?(move)}.detect do |move|
           board.update(move, self)
           winning = won?(board, player_token)
           board.reset_cell!(move)
           puts "winning move play" if winning
           winning
       end
    end

    def blocking_move(board, player_token)
      puts "blocking move cleared"
       ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select{|move| board.valid_move?(move)}.detect do |move|
           board.update(move, opponent)
           blocking = won?(board, player_token)
           board.reset_cell!(move)
           puts "blocking move play" if blocking
           blocking
       end
    end

    def won?(board, player_token)
      WIN_COMBINATIONS.detect do |combo|
        combo.all? {|cell| board.cells[cell]== player_token}
      end
    end

  end
end

def best_move(board)
  valid_moves = {}

  {"1", "2", "3", "4", "5", "6", "7", "8", "9"}.each{|move| valid_moves[move] = 0 if board.valid_move?(move)}

  valid_moves.each do |move, score|
    board.update(move, self)
    WIN_COMBINATIONS.each do |combo|
      self_moves = combo.count{|cell| cell == self.token}
      opponent_moves = combo.count{|cell| cell == opponent.token}
      valid_moves = combo.count.{|cell| cell == " "}

      if self_moves == 2 && valid_moves == 1
      score += 100
      else
      score += self_moves * 10
      end

      if opponent_moves == 2 && valid moves == 1
      score -= 100
      else
     score -= opponent_moves * 10
      end

      valid_moves[move] += score
    end
    board.reset_cell!(move)
  end

  valid_moves.max_by{|move, score| score}.key
end





# stage 0 random valid move
# stage 1 simplest computer strategy is move in this order: the center, one of the four corners, one of the four sides
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
