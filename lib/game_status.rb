module GameStatus
  module InstanceMethods
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

    def current_player
     self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
    end
    
    def over?
      self.won? || self.draw?
    end

    def won?
      array_to_check = WIN_COMBINATIONS.collect do |combo|
        [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]]
      end

      array_to_check.include?(["X", "X", "X"]) || array_to_check.include?(["O", "O", "O"])
    end

    def draw?
      !won? && board.full?
    end

    def winner
      array_to_check = WIN_COMBINATIONS.collect do |combo|
        [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]]
      end

      if array_to_check.include?(["X", "X", "X"]) 
        "X" 
      elsif array_to_check.include?(["O", "O", "O"])
        "O"
      else
        nil
      end
    end
  end
end