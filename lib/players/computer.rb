require 'pry'

module Players
  class Computer < Player 
    attr_reader :corners, :center, :middles, :random
    DEFENSIVE = [2, 0, 1, 5, 3, 4, 8, 6, 7, 6, 0, 3, 7, 1, 4, 8, 2, 5, 8, 0, 4, 6, 2, 4]
    
    NEAR_WIN_COMBINATIONS = [
      [0, 1],
      [1, 2],
      [0, 2],
      [3, 4],
      [4, 5],
      [3, 5],
      [6, 7],
      [7, 8],
      [6, 8], 
      [0, 3], 
      [3, 6], 
      [0, 6], 
      [1, 4], 
      [4, 7], 
      [1, 7], 
      [2, 5], 
      [5, 8], 
      [2, 8], 
      [0, 4], 
      [4, 8], 
      [0, 8], 
      [2, 4], 
      [4, 6], 
      [2, 6]
    ]
    
    def initialize(token)
      super
      @corners = ["1", "3", "7", "9"]
      @center = "5"
      @middles = ["2", "4", "6", "8"]
      @random = Random.new
    end
    
    def move(board)
      if board.turn_count == 1
        @center unless corners_taken?(board)
      end
      binding.pry
    end
  
    def corners_taken?(board)
      @corners.detect{|c| board.taken?(c)} 
    end
    
    def opponent_danger(board)
      
    end
    
    def nearly_won?(board)
      nearly_won_combinations = []
      NEAR_WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        if (position_1 == "X" && position_2 == "X") || (position_1 == "O" && position_2 == "O")
          nearly_won_combinations << win_combination
        end
      end
      
      defensive_move = nil
      
      nearly_won_combinations.each do |combination|
        index = find it in NEAR_WIN_COMBINATIONS
        block = DEFENSIVE[index]
        if !block.taken? then defensive_move = block
      end
      defensive_move
    end
    
    
    
    
  end
end