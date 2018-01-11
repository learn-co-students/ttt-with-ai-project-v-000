require "pry"
module Players

class Computer < Player
  def move(board)
    if !board.full?
    #  nPos = self.genRandomPosition(board)
      nPos = self.ai(board)
		  nPos.to_s
	  else
		  false
  	end # end if
  end  # end #move


  def ai(board)
    #must return a number
    cells = board.cells
    if cells.include?(self.token) # already madea a first move
      win_combo = [ [0,1,2] , [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]   ]
      to_move = win_combo.select do | combo |
        combo_pos = [ cells[combo[0]], cells[combo[1]], cells[combo[2]]  ]
        n = 0
        if combo_pos.include?(self.token)
          n = combo_pos.count{ |ele| ele == " " || ele == self.token }
        end
        n == 3
      end # end select
      puts "AI: #{to_move}!"
    #  binding.pry
      if to_move.empty?
        self.genRandomPosition(board)
      else
        moves = to_move[0].select { |cell_pos| cells[cell_pos] == " " }
      #  binding.pry
        moves[0] + 1
      end

    else #haven't made a first move
      self.genRandomPosition(board)
    end # end if
  end# end ai

  def genRandomPosition(board)
    nPos = rand(9) + 1
      canMoveHere = board.valid_move?(nPos)
    while !canMoveHere do
      nPos = rand(9) + 1
      canMoveHere = board.valid_move?(nPos)
    end  # end while
    nPos
  end


end #end Computer class


end # end of module
