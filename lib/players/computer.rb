require 'pry'

module Players
  class Computer < Player 
    
    attr_reader :corners, :center, :middles, :random, :opponent_token
    
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
    
    FINAL_WIN_COMBINATION = [2, 0, 1, 5, 3, 4, 8, 6, 7, 6, 0, 3, 7, 1, 4, 8, 2, 5, 8, 0, 4, 6, 2, 4]
    
    # FINAL_WIN_COMBINATION is the corresponding missing index for each NEAR_WIN_COMBINATIONS to make a full WIN_COMBINATION. 
    
    def initialize(token)
      super
      @corners = ["1", "3", "7", "9"]
      @center = "5"
      @middles = ["2", "4", "6", "8"]
      @random = Random.new
      @opponent_token = "X" unless self.token == "X"
      @opponent_token = "O" unless self.token == "O"
    end
    
    def move(board)
      binding.pry
      if board.turn_count == 0 || (board.turn_count == 1 && board.taken?("5"))
        "7"
      elsif board.turn_count == 1
        "5"
      elsif nearly_won?(board)
        nearly_won?(board)
      elsif nearly_lost?(board)
        nearly_lost?(board)
      elsif corners_taken?(board)
        corners_taken?(board)
      else
        random_number(board)
      end
    end
    
    def random_number(board)
      a = @random.rand(1..9)
      b = @random.rand(1..9)
      c = @random.rand(1..9)
      d = @random.rand(1..9)
      e = @random.rand(1..9)
      f = @random.rand(1..9)
      g = @random.rand(1..9)
      h = @random.rand(1..9)
      i = @random.rand(1..9)
      
      random_numbers = ["#{a}", "#{b}", "#{c}", "#{d}", "#{e}", "#{f}", "#{g}", "#{h}", "#{i}", "9", "8", "7", "6", "5", "4", "3", "2", "1"]
      
      random_numbers.detect{|a| board.taken?(a) == false}
    end
  
    def corners_taken?(board)
      @corners.detect{|c| board.taken?(c)} 
    end
    
    def nearly_lost?(board)
      nearly_lost_combinations = []
      
      NEAR_WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        if position_1 == @opponent_token && position_2 == @opponent_token
          nearly_lost_combinations << win_combination
        end
      end
      
      defensive_move = nil
      
      nearly_lost_combinations.each do |combination|
        index = NEAR_WIN_COMBINATIONS.index(combination)
        block = FINAL_WIN_COMBINATION[index] + 1
        if !board.taken?(block) 
          defensive_move = block
        end
      end
      defensive_move
    end
    
    def nearly_won?(board)
      nearly_won_combinations = []
      
      NEAR_WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        if position_1 == @token && position_2 == @token
          nearly_won_combinations << win_combination
        end
      end
      
      winning_move = nil
      
      nearly_won_combinations.each do |combination|
        index = NEAR_WIN_COMBINATIONS.index(combination)
        move = FINAL_WIN_COMBINATION[index] + 1
        if !board.taken?(move) 
          winning_move = move
        end
      end
      winning_move
    end
    
    
  end
end