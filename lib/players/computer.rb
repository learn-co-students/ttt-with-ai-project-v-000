require 'pry'


#1: Win if possible
#2: Block if necessary

#3: Take the center square if free
#4: Take a corner square if free
#5: Take whatever is available


module Players
  class Computer < Player
    def move(board)


      valid_moves = (1..9).to_a
      corner_moves = [1, 3, 7, 9]
      move = nil

      if !board.taken?(5) #3: Take the center square if free
        move = 5
      elsif corner_moves.any? { |c| !board.taken?(c) }
        move = corner_moves.detect { |c| !board.taken?(c) } #4: Take a corner square if free
      else
        Game::WIN_COMBINATIONS.detect do |wc|
          if wc.select { |i| board.position(i+1) == token }.size == 2 && wc.any? { |i| i == " " }
            move = wc.detect { |i| i == " " }.to_s
          end
          move
        end
        move = valid_moves.sample.to_s if move == nil
      end

      move
    end
  end
end



#def move(board)
#  valid_moves = (1..9).to_a
#  valid_moves.sample.to_s
#end
