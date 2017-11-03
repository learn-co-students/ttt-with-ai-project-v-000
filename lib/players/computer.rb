module Players
  class Computer < Player
    def move(board)
      other_moves = [2, 4, 6, 8]
      best_moves = [1, 3, 7, 9]
      move = nil

      if !board.taken?(5)
        move = 5
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select { |i| board.position(i+1) == token }.size == 2
            move = combo.detect { |i| !board.taken?(i+1) }.+(1)
          else
            move = best_moves.select { |i| !board.taken?(i) }.sample
          end
        end
        move = other_moves.select { |i| !board.taken?(i) }.sample if move == nil
      end
      move.to_s
    end
  end
end

#1: Win if possible
#2: Block if necessary
#3: Take the center square if free
#4: Take a corner square if free
#5: Take whatever is available
