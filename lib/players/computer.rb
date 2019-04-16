module Players
  class Computer < Player
  attr_writer :e_token


    def move(board)
      sleep(1)
      if !board.taken?(5) && board.turn_count <=2
        play = "5"
      elsif board.turn_count <=2 && [1,3,7,9].any? {|idx| board.position(idx) == " " }
        play = [1,3,7,9].select {|idx| board.position(idx) == " "}.sample.to_s
      else
        play = available_spaces(board).sample.to_s
      end
      victory = "uncertain"
      combinations.detect do |combo|
      # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
        if combo.select{|idx| board.position(idx+1) == token}.size == 2 && combo.any?{|idx| board.position(idx+1) == " "}
          play = combo.detect {|idx| !board.taken?(idx+1)}.to_i.+(1).to_s
          victory = "certain"
        end
      end
      # If you can't play any winning moves, play a move to block the opponent from winning.
      combinations.detect do |combo|
        if combo.select{|idx| board.position(idx+1) == e_token}.size == 2 && combo.any?{|idx| board.position(idx+1) == " "} && victory == "uncertain"
          play = combo.detect {|idx| !board.taken?(idx+1)}.to_i.+(1).to_s
          victory = "prevented loss"
        end
      end
      traps.detect do |combo|
        if combo.select{|idx| board.position(idx+1) == e_token}.size == 2 && combo.any?{|idx| board.position(idx+1) == " "} && victory == "uncertain"
          play = combo.detect {|idx| !board.taken?(idx+1)}.to_i.+(1).to_s
          victory = "prevented ace in the hole"
        end
      end
      #If no winning moves, or no need to block, ace in the hole.
      traps.detect do |combo|
        if combo.select{|idx| board.position(idx+1) == token}.size == 2 && combo.any?{|idx| board.position(idx+1) == " "} && victory == "uncertain"
          play = combo.detect {|idx| !board.taken?(idx+1)}.to_i.+(1).to_s
          victory = "ace in the hole"
        end
      end
      play
    end

    def available_spaces(board)
      spaces = (1..9).to_a
      spaces.select {|space| !board.taken?(space)}
    end

    def e_token
      token == "X" ? @e_token = "O" : @e_token = "X"
    end

    def combinations
      Game::WIN_COMBINATIONS
    end
    def traps
      Game::TRAPS
    end
  end
end
