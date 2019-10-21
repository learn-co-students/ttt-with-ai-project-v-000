module Players
  class Computer < Player
    def move(board)
      @current_board = []
      @last_board = []
      x = 0
      
      board.cells.each do |index|
        @current_board << "#{index}#{x}"
        x += 1
      end
      difference = (@current_board - @last_board)[0]
      xxxy = @current_board.index(difference)
      their_last_move = xxxy.to_i + 1 
      
      if !board.taken?(5)
        @last_board = board.cells
        "5"
      else
        @last_board = board.cells 
        a = [2, 4, 6, 8].sample
        a 
      end 
    
      if their_last_move == 1
        if !board.taken?(2)
          @last_board = board.cells
          "2"
          elsif !board.taken?(4)
          @last_board = board.cells
          "4"
        end
        
        elsif their_last_move == 2 
        if !board.taken?(1)
          @last_board = board.cells
          "1"
          elsif !board.taken?(3)
          @last_board = board.cells
          "3"
        end
        
        elsif their_last_move == 3
        if !board.taken?(2)
          @last_board = board.cells
          "2"
          elsif !board.taken?(6)
          @last_board = board.cells
          "6"
        end
        
        elsif their_last_move == 4
        if !board.taken?(1)
          @last_board = board.cells
          "1"
          elsif !board.taken?(7)
          @last_board = board.cells
          "7"
        end
        
        #elsif their_last_move == 6
        #if !board.taken?(3)
          #@last_board = board.cells
          #"3"
          #elsif !board.taken?(9)
          #@last_board = board.cells
          #"9"
        #end
        
        #elsif their_last_move == 7 
       #if !board.taken?(4)
          #@last_board = board.cells
          #"4"
          #elsif ! board.cells.taken?(8)
          #@last_board = board.cells
          #"8"
        #end
        
        #elsif their_last_move == 8 
        #if !board.taken?(7)
          #@last_board = board.cells
          #"7"
          #elsif !board.taken?(9)
          #@last_board = board.cells
          #"9"
        #end
        
        #elsif their_last_move == 9
        #if !board.taken?(6)
          #@last_board = board.cells
          #"6"
          #elsif !board.taken?(8)
          #@last_board = board.cells
          #"8"
        end
      end
    end
  end
end