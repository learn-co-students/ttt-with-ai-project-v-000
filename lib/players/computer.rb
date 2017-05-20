module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    def move(board)
      move = nil
      puts "Computer's move:"
      if token == "X"
        move = "1"
      elsif token == "O" && !board.taken?(5)
        move = "5"
      elsif token == "O" && !board.taken?(1)
        move = "1"
      elsif token == "X" && !board.taken?(3)
        move = "3"
      elsif token == "X" && !board.taken?(9)
        move = "9"

      #if !board.taken?(5)
      #  move = "5"
      #elsif !board.taken?(1)
      #  move = "1"
      #elsif !board.taken?(2)
      #  move = "2"
      #elsif !board.taken?(9)
      #  move = "9"

      #elsif !board.taken?(8)
      #  move = "8"
      #elsif !board.taken?(6)
      #  move = "6"
      #elsif !board.taken?(2)
      #  move = "2"
      end
      move
    end #Move
  end #Class
end #Module

      #elsif WIN_COMBINATIONS.detect do |combo|
      #    if board.position(combo[0]+1) == token && board.position(combo[1]+1) == token && !board.taken?(combo[2]+1)
      #      move = !board.taken?(combo[2]+1).to_s
      #    elsif board.position(combo[1]+1) == token && board.position(combo[2]+1) == token && !board.taken?(combo[0]+1)
      #      move = !board.taken?(combo[0]+1).to_s
      #    elsif board.position(combo[0]+1) == token && board.position(combo[2]+1) == token && !board.taken?(combo[1]+1)
      #      move = !board.taken?(combo[1]+1).to_s
      #    end
      #  end
      #elsif WIN_COMBINATIONS.detect do |combo|
      #    if board.position(combo[0]+1) != token && board.position(combo[1]+1) != token && board.taken?(combo[2]+1)
      #      move = board.taken?(combo[2]+1).to_s
      #    elsif board.position(combo[1]+1) != token && board.position(combo[2]+1) != token && board.taken?(combo[0]+1)
      #      move = board.taken?(combo[0]+1).to_s
      #    elsif board.position(combo[0]+1) != token && board.position(combo[2]+1) != token && board.taken?(combo[1]+1)
      #      move = board.taken?(combo[1]+1).to_s
      #    end
      #  end

      #Win: If the player has two in a row, they can place a third to get three in a row.
      #Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
      #Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
      #Blocking an opponent's fork:
      #Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
      #Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
      #Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
      #Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
      #Empty corner: The player plays in a corner square.
      #Empty side: The player plays in a middle square on any of the 4 sides.
