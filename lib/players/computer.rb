module Players
  class Computer < Player
    def move(board)
      
      index_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      options_array = []
      
      index_array.each do |item|
        if !board.taken?(item)
          options_array << item 
        end
      end
      
      if !board.taken?("5")
        options_array.delete(5)
        "5"
        elsif !board.taken?("2")
        options_array.delete(2)
        "2"
        elsif !board.taken?("4")
        options_array.delete(4)
        "4"
        elsif !board.taken?("6")
        options_array.delete(6)
        "6"
        elsif !board.taken?("8")
        options_array.delete(8)
        "8"
      end

      a = options_array.sample
      options_array.delete(a)
      "#{a}"
    end
  end
end
        #elsif !board.taken?(2)
        #"2"
        #elsif !board.taken?(4)
        #"4"
        #elsif !board.taken?(1)
        #"1"
        #elsif !board.taken?(3)
        #"3"
        #elsif !board.taken?(6)
        #"6"
        #elsif !board.taken?(7)
        #"7"
        #elsif !board.taken?(9)
        #"9"
        #elsif !board.taken?(8)
        #"8"
      #end
    #end
  #end
#end

#################################################################################

 #if !board.taken?(5)
        #"5"
        #elsif board.taken?(5)
        #a = [2, 4, 6, 8].sample
        #"#{a}"
        #elsif !board.taken?(2)
        #"2"
        #elsif !board.taken?(4)
        #"4"
        #elsif !board.taken?(1)
        #"1"
        #elsif !board.taken?(3)
        #"3"
        #elsif !board.taken?(6)
        #"6"
        #elsif !board.taken?(7)
        #"7"
        #elsif !board.taken?(9)
        #"9"
        #elsif !board.taken?(8)
        #"8"
        
###########################################################################
        
        
         #elsif !board.taken?(9)
          #@last_board = board.cells
          #"9"
        #end
        #end
        
        #elsif their_last_move == 4
        #if !board.taken?(1)
          #last_board = board.cells
          #"1"
          #elsif !board.taken?(7)
          #last_board = board.cells
          #"7"
        #end
      
      #end
        
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
        #end
      #end
    #end
  #end
#end

####################################################

    #board.cells.each do |item|
        #current_board << "#{item}#{x}"
        #x += 1
      #end
      
      #difference = (current_board - last_board)[0]
      #xxxy = current_board.index(difference)
      #their_last_move = xxxy.to_i + 1 
      
      #binding.pry
    #end
  #end
#end

#################################################

 #current_board = []
      #last_board = []
      #x = 0