require 'pry'
module Players
  class Computer < Player
  
  # WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8], [2,4,6]]
  
    def move(board)
      
      corners = [1, 3, 7, 9]
      sides = [2, 4, 6, 8]
      
      if board.turn_count == 0 
        corners.sample.to_s
      elsif board.cells[4] == " "
        "5"
      elsif board.turn_count == 1 && board.cells[4] != " "
        corners.sample.to_s
  
      else
        empty_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
        empty_positions = empty_indices.map {|p| p.to_i + 1}
        empty_positions.sample.to_s
      end
    end
  end
end
  
      # case board.turn_count
      #   when 0
      #     corners.sample.to_s
      #   when 1 && board.cells[4] == " "
      #     "5"
      #   when 1 && board.cells[4] != " "
      #     corners.sample.to_s
      #   else
      #     empty_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
      #     empty_positions = empty_indices.map {|p| p.to_i + 1}
      #     empty_positions.sample.to_s
      # end
        
    
    
        
        
        # when 2 || 3 
        #   x_plays = board.cells.each_index.select {|i| board.cells[i] == "X"}
        #   o_plays = board.cells.each_index.select {|i| board.cells[i] == "O"}
        #   possible_plays = board.cells.each_index.select {|i| board.cells[i] == " "}
        #   binding.pry
        #   check_for_wins = possible_plays.each do |p|
        #     x_plays << p
        #     x_plays.sort 
        #     win_play = WIN_COMBINATIONS.detect do |combo|
        #       x_plays.sort[combo[0]] == x_plays.sort[combo[1]] &&
        #       x_plays.sort[combo[1]] == x_plays.sort[combo[2]] &&
        #       x_plays.sort[combo[0]] != " "
        #     end
            # win_play.detect {|w| w == p}
            # win_play.to_s
            # binding.pry

         
  
  
      
  
  
      # player's first move
      # if board.turn_count == 0 
      #   corners.sample.to_s
      # elsif board.turn_count == 1 && board.cells[4] == " "
      #   "5"
      # elsif board.turn_count == 1 && board.cells[4] != " "
      #   corners.sample.to_s
      # # player's next move  
      # else
      #   empty_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
      #   empty_positions = empty_indices.map {|p| p.to_i + 1}
      #   empty_positions.sample.to_s
      # end
      #binding.pry
      
      #
      
      
      # https://stackoverflow.com/questions/8484592/how-to-do-find-index-for-multiple-values-in-a-ruby-array

      # For AI - needs to use winning combos and available spaces to select. For example, only choose positions that are part of a winning combo and the other position in the winning combo are empty or occupied by self. 
    