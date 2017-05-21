require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)
      move = nil
      puts "Computer's move:"
      if board.turn_count < 2
        if !board.taken?(5)
          move = "5"
        else !board.taken?(1)
          move = "1"
        end
      elsif board.turn_count >= 2
        #Check for opportunity to win first
        if win(board).count >= 1
          win(board)[0].to_s
        #Then, check for opponent's opportunity to win and block it
        elsif block(board).count >= 1
          block(board)[0].to_s
        else
          move = MOVES.sample
          #binding.pry
        end
      end
      move
    end

    #Win: If the player has two in a row, they can place a third to get three in a row
    def win(board)
      best = []
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == self.token.to_s && board.cells[combo[1]] == self.token.to_s && !board.cells[combo[2]] == " "
          best << combo[2]
        elsif board.cells[combo[1]] == self.token.to_s && board.cells[combo[2]] == self.token.to_s && !board.cells[combo[0]] == " "
          best << combo[0]
        elsif board.cells[combo[0]] == self.token.to_s && board.cells[combo[2]] == self.token.to_s && !board.cells[combo[1]] == " "
          best << combo[1]
        end
      end
      best
    end

    #Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
    def block(board)
      stop = []
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] != self.token.to_s && board.cells[combo[1]] != self.token.to_s && !board.cells[combo[2]] == " "
          stop << combo[2]
        elsif board.cells[combo[1]] != self.token.to_s && board.cells[combo[2]] != self.token.to_s && !board.cells[combo[0]] == " "
          stop << combo[0]
        elsif board.cells[combo[0]] != self.token.to_s && board.cells[combo[2]] != self.token.to_s && !board.cells[combo[1]] == " "
          stop << combo[1]
        end
      end
      stop
    end

  end
end




      #Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
      #Blocking an opponent's fork:
      #Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
      #Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
      #Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
      #Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
      #Empty corner: The player plays in a corner square.
      #Empty side: The player plays in a middle square on any of the 4 sides.
