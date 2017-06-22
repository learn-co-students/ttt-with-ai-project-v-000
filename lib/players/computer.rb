require 'pry'

module Players
  class Computer < Player

    CORNERS = [1, 3, 7, 9]

# below is a dumb solution that goes anywhere free
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
      #(0) if you are x and playing first, go in a corner
      #(1) if you are o and going second,
      #(2) if you are one away from a win, make the player_2
      #(3) if opponent is one away from win, block
      #(4) otherwise, fill in a corner
      next_move = nil
      if board.turn_count == 1
        next_move = CORNERS.sample
      end
      if !next_move && token == "O" && board.valid_move?("5")
        next_move = "5"
      end
      if !next_move && token == "X" &&
      if !next_move
        next_move = detect_possible_win(token)
      end
      if !next_move
        next_move = detect_possible_win(opponent_token)
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

  def detect_possible_win(token)
    move = nil
    Game::WIN_COMBINATIONS.detect do |combination|
      if combination.count {|i| board.position(i+1) == token} == 2 && combination.count{|i| !board.taken?(i+1) == 1}
        move = (combination.detect{|i| !board.taken?(i+1)}.to_i + 1).to_s
      end
    end
    move
  end

end
end
