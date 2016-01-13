class Computer < Player

  attr_reader :best_move, :board_state

  WIN_COMBINATIONS= [
      [0,1,2],  #top row
      [3,4,5], #middle row
      [6,7,8],  #bottom row
      [0,3,6],  #left column
      [1,4,7],  #middle column
      [2,5,8],  #right column
      [0,4,8],  #diagonal 1
      [6,4,2]   #diagonal 2
  ]

  def move(board_state)
    @board_state = board_state
    @best_move = nil
    check_for_win
    if @best_move == nil
      random_spot
    end
    @best_move += 1 #not sure why needs to return as a string for test
    @best_move.to_s
  end

  def check_for_win
    WIN_COMBINATIONS.each do |combo|
      #check for best two of 3
      temp_array = []
      temp_array.push(board_state.cells[combo[0]])
      temp_array.push(board_state.cells[combo[1]])
      temp_array.push(board_state.cells[combo[2]])
      if temp_array[0] != ' ' && temp_array[0] == temp_array[1] && temp_array[2] == ' '
        @best_move = combo[2]
        break
      elsif temp_array[1] != ' ' && temp_array[1]== temp_array[2] && temp_array[0] == ' '
        @best_move = combo[0]
        break
      elsif temp_array[0] != ' ' && temp_array[0] == temp_array[2] && temp_array[1] == ' '
        @best_move = combo[1]
        break
      end
    end
  end

  def random_spot
    temp_board = @board_state.cells
    array_empty_spaces = []
      x = 1
      temp_board.each do |space|
        if space == " "
          array_empty_spaces.push(x)
        end
        x+=1
      end
    @best_move = array_empty_spaces.sample
  end


  #plan is to take game states, see if you have 2 spots in any and make the next move
  #see if opponent has two spots in any, and block
  #if neither have two spots, pick one that has only you and no other
  #if all else fails, pick a random one



end