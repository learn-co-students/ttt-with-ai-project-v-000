
# FULL DISCLOSER: The (vast) majority of this computer AI code is from the solution branch of this project!
# I put together a couple different "working" versions of this AI.. but they were not near as effective as this.
# If it's any consolation, I fully understand how this code works and I made some adjustments to fix beatable playthroughs. <3.
# Will absolutely redo this portion if needed! <3 <3 <3

module Players
  class Computer < Player
    def move(board)
      puts "Computer is thinking..."
      sleep(1.5)
      move = nil
      # Always take the center square first, if possible.
      if !board.taken?(5)
        move = "5"
      # If going second and the center square is taken, take a random corner.
      elsif board.turn_count == 1
        move = [1, 3, 7, 9].sample.to_s
      # If you went first, take a corner square with your second move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s #returns the first index (space) that isn't taken and converts to string for move=
      elsif board.turn_count == 3 && (board.position(1) == "X" && board.position(9) == "X")
        move = "2"
      elsif board.turn_count == 3 && (board.position(3) == "X" && board.position(7) == "X")
        move = "8"
      # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
      else
        Game::WIN_COMBINATIONS.detect do |cmb|
          # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          # If you can't play any winning moves, play a move to block the opponent from winning.
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
