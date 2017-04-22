#~~~HAVICK WAS HERE~~~

module Players
  class Computer < Player

def move(board)
	@board = board
  move = nil
   if !board.taken?(5)		#IT TAKES THE MIDDLE OR IT GETS THE HOSE AGAIN
   	move = "5"
   	elsif board.turn_count == 1		#IF SECOND PLAYER, TAKE THE UPPER LEFT CORNER (UNLESS 5 IS AVAILABLE)
   		move = "1"
   	elsif board.turn_count == 2
   		move = [1, 3, 7, 9].detect {|op| !board.taken?(op)}.to_s	#IF YOU WENT FIRST AND THEY TOOK MID TAKE THE FIRST CORNER YOU SEE

    elsif board.turn_count == 3 && board.position(1) == board.position(3) || board.turn_count == 3 && board.position(9) == board.position(7)# IF THEY TOOK CORNERS BLOCK 2 (MID-TOP)
   		   			move = [1,2,3,4,5,6,7,8,9].detect {|i| !board.taken?(i)}.to_s

   	else
   		Game::WIN_COMBINATIONS.detect do |combo|
   			if combo.select {|sq| board.position(sq+1) == token}.size == 2 && combo.any?{|sq| board.position(sq+1) == " " }
   				 move = combo.select{|sq| !board.taken?(sq+1)}.first.to_i.+(1).to_s  #CHECK FOR WIN POSS...  AND TAKE THAT.
   	elsif

   	combo.select {|sq| board.position(sq+1) != " " && board.position(sq+1) != token}.size == 2 && combo.any?{|sq| board.position(sq+1) == " "}
   				 move = combo.select{|sq| !board.taken?(sq+1)}.first.to_i.+(1).to_s   #SHOULD MAKE SELECTION BASED ON OPP POS IF NOT ABLE TO WIN

     			end #DO
			end #if (1)
		 move = [1,2,3,4,5,6,7,8].detect{|i| !board.taken?(i)}.to_s if move == nil #I tried a couple ways to use array.sample... but anyway
		end #if (2)
	move
	  end #move
	end  #class
end  # module
