require 'pry'
module Players
  class Computer < Player
  
    def move(board)
      
      corners = [1, 3, 7, 9]
      
      if board.turn_count == 0 
        corners.sample.to_s
      elsif board.turn_count == 1 && board.cells[4] == " "
        "5"
      elsif board.turn_count == 1 && board.cells[4] != " "
        corners.sample.to_s
      elsif
        board.cells
      
      else
        empty_indices = board.cells.each_index.select {|i| board.cells[i] == " "}
        empty_positions = empty_indices.map {|p| p.to_i + 1}
        empty_positions.sample.to_s
      end
      #binding.pry
      
      # https://stackoverflow.com/questions/8484592/how-to-do-find-index-for-multiple-values-in-a-ruby-array

      # For AI - needs to use winning combos and available spaces to select. For example, only choose positions that are part of a winning combo and the other position in the winning combo are empty or occupied by self. 
    end
  end
end