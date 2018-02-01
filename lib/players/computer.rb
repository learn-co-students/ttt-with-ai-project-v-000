module Players
  class Computer < Player
    attr_accessor :game

    def move(a)
      if @game.turn_count == 0
        a = "5" #go to middle when board is empty
      elsif @game.turn_count == 1 #if second player, first move: check if middle is occupied; if yes, go to corner cells.
        if !@game.board.taken?("5")
          a = "5"
        else
          a = ["1","3","7","9"][rand(0..3)]
        end
      elsif @game.turn_count == 2 #second move if AI went first (go to diagonal corner cell)
        a = ["1","3","7","9"].detect{|a|!@game.board.taken?(a)} #occupy the corners whichever one was not occupied
      elsif @game.turn_count == 3
        #second move when opponent went first: first check if opponent has a winning move, if yes, block; if no, then go for a winning move
        if (@board.position(1) == @board.position(9) || @board.position(3) == @board.position(7)) #if opponent occupied corners
          a = "5"
        elsif @board.position.taken?("5") #check if the existing 2 moves by opponents is in the winning combo
          current_position = [1..9].select {|a|@game.board.taken?(a.to_s)}
          current_position = current_position.collect {|a|a.to_s}
          current_position = current_position.delete_if{|s|@game.board.positiion(s) == self.token} #current player's position index array
          Game::WIN_COMBINATIONS.detect do |cmb|
            if current_position.to_set.subset?(cmb.to_set) #opponent has 2 of the 3 winning positions - need to block
              a = cmb.detect {|a|!@game.board.taken?(a)}
            else
              a = ["1","3","7","9"].detect{|a|!@game.board.taken?(a)}
            end
          end
        end


        end
      end
    end
  end
end
