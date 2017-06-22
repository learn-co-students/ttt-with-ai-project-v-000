require 'pry'

module Players
  class Computer < Player

    CORNERS = [1, 3, 7, 9]

# below is a dumb solution that goes anywhere
# it could be rewritten to try to win
    # def move(board)
    #   valid_moves = []
    #   for i in 1..9
    #     if board.valid_move?(i.to_s)
    #       valid_moves << i.to_s
    #     end
    #   end
    #   valid_moves.sample
    # end


    def move(board)
      #strategy should be:
      #(1) take the middle
      #(2) if you are one away from a win, make the player_2
      #(3) if opponent is one away from win, block
      #(4) otherwise, fill in a corner
      next_move = nil
      if board.valid_move?("5")
        next_move = "5"
      end
      if !next_move
        Game::WIN_COMBINATIONS.detect do |combination|
          if combination.count do {|i| board.position(i+1) == token} == 2 && combination.count{|i| !board.taken?(i+1) == 1}
            next_move = (combination.detect{|i| !board.taken?(i+1)}.to_i + 1).to_s
          end
        end
      end
      if !next_move
        Game::WIN_COMBINATIONS.detect do |combination|
          if combination.count do {|i| board.position(i+1) == opponent_token} == 2 && combination.count{|i| !board.taken?(i+1) == 1}
            next_move = (combination.detect{|i| !board.taken?(i+1)}.to_i + 1).to_s
          end
        end
      end
      if !next_move && CORNERS.detect{|i| !board.taken?(i)}.to_s
        next_move = CORNERS.detect{|i| !board.taken?(i)}.to_s
      elsif !next_move
        next_move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken?(i)}.to_s
      end
      next_move
    end

  def opponent_token
      @token == "X" ? "O" : "X"
  end
end
