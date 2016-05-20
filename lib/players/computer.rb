class Player::Computer < Player

############ Minimax algorithm implementation #####################

# the algorithm looks at the board to see what spaces are open
# it fills each space it can, assigning a score each time
# it looks at all the game states it generated and the picks the max one

  def move(board)
    if board.turn_count == 0
      1 #is this right? do I want to put the index of cell I want the move to be or the 
      # position? (ie 1-9)
    else
      #TODO - want the computer to generate hypothetical games and then pick
      #the best move by assigning a score to each game end-state 
      #so call the moves function + the scores function
    end 
  end 

  def score
    if self.won?
      return 10
    elsif draw?
      return 0
    else 
      return -10
    end 
  end 

  def possible_moves
    possible_moves = []
    board.cells.each_with_index do |cell, index| 
      if cell == " "
        return (index + 1)
        possible_moves << index
      end
    end 
  end 

###################################################################


  WIN_COMBINATIONS = [ 
                      [0,1,2], 
                      [3,4,5], 
                      [6,7,8], 
                      [0,3,6], 
                      [1,4,7], 
                      [2,5,8], 
                      [0,4,8], 
                      [6,4,2] 
                    ]

  def won?
    WIN_COMBINATIONS.each do |combo|
      index_1 = combo[0]  #the zero-ith index in the whatever'eth combo 
      index_2 = combo[1]
      index_3 = combo[2]
      position_1 = self.board.cells[index_1] #what is on the board at a particular index 
      position_2 = self.board.cells[index_2]
      position_3 = self.board.cells[index_3]
      if position_1 != " " && position_1 == position_2 && position_2 == position_3 && position_3 == position_1
          return combo 
      end
    end
    false
  end

  def current_player
    if board.turn_count.even? 
      self.player_1
    else
      self.player_2
    end
  end 


  def draw?
    board.full? && !self.won?(board)
  end 

  def over?
    self.draw?(board) || self.won?(board)
  end 

end
