require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@random_move = (1..9).to_a.sample.to_s

    # check for move validity in this class to add additional computer intelligence
    # possibly initialize game in player class as well
    # include game as a move argument so you know which token you are
    # make a block win method

    def move(board, game = Game.new)
      move = nil
      if board.turn_count == 0
        return @@corner_move
      end
      until board.valid_move?(move)
        move = @@random_move
      end
      move
      # binding.pry
    end
    


    # def move(board)
    #   # computer strategy
    #   move = nil
    #   if !board.taken?(5)
    #     # take center
    #     move = "5"
    #   elsif board.turn_count == 1
    #     # if center is taken, take upper left corner
    #     move = "1"
    #   elsif board.turn_count == 2
    #     # take corner to position yourself for a win
    #     move = @@corner_move
    #   elsif board.turn_count == 3 && board.position(1) == board.position(9) || board.position(3) == board.position(7)
    #     # block other player's possible win
    #     move = "2"
    #   else
    #     Game::WIN_COMBINATIONS.find do |combo|
    #       # try to win the game
    #       if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
    #         move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
    #       # If you can't win, block other player's possible win
    #       elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
    #         move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
    #       end
    #     end
    #     if move == nil
    #       move = @@random_move
    #     end
    #   end
    #   move
    # end

    
  end
end