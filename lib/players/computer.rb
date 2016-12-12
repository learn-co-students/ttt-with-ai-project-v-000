class Computer < Player
	
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],  
    [6,7,8], 
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]
  

    def move(board)
      @place = 0
    WIN_COMBINATIONS.each do |wincombo|
      array = [ board.cells[wincombo[0]] ,  board.cells[wincombo[1]], board.cells[wincombo[2]] ]

      if array.include?(" ") && array.count("X") == 2 
       		@place += wincombo[array.index(" ")] + 1
         break
      elsif array.include?(" ") && array.count("O") == 2 
      	  @place += wincombo[array.index(" ")] + 1
       		break
      end

     end
      if @place == 0
        @place = rand(1..9)

      end
      @place.to_s
    end

end