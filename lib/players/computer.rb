# Created by Naomi Dennis
# Full Stack Web Development v3
# Flatiron School
# 1/11/2018
require "pry"
module Players
## AI Drawbacks
### If two AI are competing against each other, they don't attempt to compromise the other.
### Both will rush to complete a winning combination that intersects with their first move
## The AI works best when facing a human opponent.
class Computer < Player

  def move(board)
    ## If the board has free spaces, attempt to move to a space
    if !board.full?
      nPos = self.ai(board)
		  nPos.to_s
	  else
		  false
  	end # end if
  end  # end #move


  def ai(board)
    # Make a first move
    # Try to complete a winning combination
    cells = board.cells
    ## Has a first move been made?
    if cells.include?(self.token) # Yes, a first move has been made
      win_combo = [ [0,1,2] , [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]   ]
      to_move = win_combo.select do | combo | ## select all winning combinations that intersect with the first move
        ## The opponent cannot be obstructing the combination
        combo_pos = [ cells[combo[0]], cells[combo[1]], cells[combo[2]]  ]
        n = 0
        if combo_pos.include?(self.token)
          n = combo_pos.count{ |ele| ele == " " || ele == self.token }
        end
        n == 3
      end # end select

      ## If no combination was found or if the combination was blocked by the opponent
      if to_move.empty?
        ## Move in a random position
        self.genRandomPosition(board)
      else
        ## Move to one of the spaces in the winning combination
        moves = to_move[0].select { |cell_pos| cells[cell_pos] == " " }
        i = rand(moves.size)
        moves[i] + 1
      end
    else  ## No first move has been made
      self.genRandomPosition(board)
    end # end if
  end# end ai

  def genRandomPosition(board)
    ## generate a random position on the board for the computer to move to. It just has to be a free space.
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
