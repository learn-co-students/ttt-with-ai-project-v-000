class Players::Computer < Player 

  def move(board)
    viable = []
    @mine = []
    @theirs = []
    
    board.cells.each_with_index do |cell, index| 
      viable << index if cell == " "
      end

    board.cells.each_with_index do |cell, index|
      if cell == self.token 
        @mine << index
      elsif cell != self.token && cell != " "
        @theirs << index 
      end# of if
    end# of do 
    
      def win
        case @mine 
        when @mine.include?(0) && @mine.include?(1)
          "3"
        when @mine.include?(1) && @mine.include?(2) 
          "1"
        when @mine.include?(0) && @mine.include?(2)
          "2"
        when @mine.include?(3) && @mine.include?(4)
          "6"
        when @mine.include?(4) && @mine.include?(5)
          "4"
        when @mine.include?(3) && @mine.include?(5)
          "5"
        when @mine.include?(6) && @mine.include?(7)
          "9"
        when @mine.include?(7) && @mine.include?(8)
          "7"
        when @mine.include?(6) && @mine.include?(8)
          "8"
        when @mine.include?(0) && @mine.include?(4)
          "9"
        when @mine.include?(4) && @mine.include?(8)
          "1"
        when @mine.include?(0) && @mine.include?(8)
          "5"
        when @mine.include?(2) && @mine.include?(4)
          "7"
        when @mine.include?(4) && @mine.include?(6)
          "3"
        when @mine.include?(2) && @mine.include?(6)
          "5"
        when @mine.include?(0) && @mine.include?(3)
          "7"
        when @mine.include?(3) && @mine.include?(6)
          "1"
        when @mine.include?(0) && @mine.include?(6)
          "4"
        when @mine.include?(2) && @mine.include?(5)
          "9"
        when @mine.include?(5) && @mine.include?(8)
          "3"
        when @mine.include?(2) && @mine.include?(8)
          "6"
        when @mine.include?(1) && @mine.include?(4)
          "8"
        when @mine.include?(4) && @mine.include?(7)
          "2"
        when @mine.include?(1) && @mine.include?(7)
          "5"
        end
      end# of win


      def block
        case @theirs 
        when @theirs.include?(0) && @theirs.include?(1)
          "3"
        when @theirs.include?(1) && @theirs.include?(2) 
          "1"
        when @theirs.include?(0) && @theirs.include?(2)
          "2"
        when @theirs.include?(3) && @theirs.include?(4)
          "6"
        when @theirs.include?(4) && @theirs.include?(5)
          "4"
        when @theirs.include?(3) && @theirs.include?(5)
          "5"
        when @theirs.include?(6) && @theirs.include?(7)
          "9"
        when @theirs.include?(7) && @theirs.include?(8)
          "7"
        when @theirs.include?(6) && @theirs.include?(8)
          "8"
        when @theirs.include?(0) && @theirs.include?(4)
          "9"
        when @theirs.include?(4) && @theirs.include?(8)
          "1"
        when @theirs.include?(0) && @theirs.include?(8)
          "5"
        when @theirs.include?(2) && @theirs.include?(4)
          "7"
        when @theirs.include?(4) && @theirs.include?(6)
          "3"
        when @theirs.include?(2) && @theirs.include?(6)
          "5"
        when @theirs.include?(0) && @theirs.include?(3)
          "7"
        when @theirs.include?(3) && @theirs.include?(6)
          "1"
        when @theirs.include?(0) && @theirs.include?(6)
          "4"
        when @theirs.include?(2) && @theirs.include?(5)
          "9"
        when @theirs.include?(5) && @theirs.include?(8)
          "3"
        when @theirs.include?(2) && @theirs.include?(8)
          "6"
        when @theirs.include?(1) && @theirs.include?(4)
          "8"
        when @theirs.include?(4) && @theirs.include?(7)
          "2"
        when @theirs.include?(1) && @theirs.include?(7)
          "5"
        end
      end# of block

     if board.cells == Array.new(9, " ")
          "5"
     elsif win
        win 
     elsif block
        block  
     else 
        (viable.sample + 1).to_s 
     end# of if 
     


    
      
  end# of move 

end# of class