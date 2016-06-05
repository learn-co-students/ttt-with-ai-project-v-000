class Computer < Player
  attr_accessor :moves

  ::WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], #right column
    [0,4,8], # diag_1
    [2,4,6]  # diag_2
  ]

  
    
  @moves = []

  def board_state(board)
    state = "first" if board.turn_count == 0
    state = "second" if board.turn_count == 1
    state = "blocking" if board.turn_count > 1
    state
  end

  def block(board)
    ::WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == @board.cells[combo[1]] ||
      board.cells[combo[0]] == @board.cells[combo[2]] &&
      board.taken?(combo[0]+1)
    end
    
  end
  
  def available(board)
    available_moves =[]
    board.cells.each_with_index do |x,i|
      available_moves << i if x == " "
      end
    available_moves.each_with_index do |x,i|
      x = x.to_s
      available_moves[i] = x
    end
    available_moves
  end

  def moves_made(board, token)
    
    made_moves =[]
    board.cells.each_with_index do |x,i|
      made_moves << i if x == token
      end
    # made_moves.each_with_index do |x,i|
    #   x = x.to_s
    #   made_moves[i] = x
    # end
    made_moves
  end



  def move (board = nil)
    moves = available(board)

    first_moves = ["1","3","5","7"]

    center_first_counters =["1","3","5","7"]

    corner_first_counters = ["0","1","2","3","5","6","7","8"]

    player_move = first.moves.shuffle[0] if board_state(board) == "first"
     
      if board_state(board) == "second"
        position_taken = board.cells.index {|x| x != " "}.to_s
          if position_taken == "4"
            player_move = center_first_counters.shuffle[0]#code center position stuff here
          else
           
            corner_first_counters.delete_if {|x| x == position_taken}
            player_move = corner_first_counters.shuffle[0]#code corner counters here
          end
      end

#only other state available is now "blocking"
    if board_state(board) == "blocking"  
      x_counter = 0
      o_counter = 0
      board.cells.each do |play| 
        x_counter += 1 if play == "X" 
        o_counter += 1 if play == "O"
      end
      x_counter > o_counter ? player_test = "X" : player_test ="O"
      test_player_moves = moves_made(board, player_test)
      
    end






    player_move #DO NOT REMOVE OR MOVE THIS
  end
    
  


end #of Computer CLASS


# if board.cells[4] != "X" || board.cells[4] != "O"
#       return "4"
#     elsif  board.cells[0] != "X" || board.cells[0] !="O"
#       return "0"
#     elsif board.cells[2] != "X" || board.cells[2] != "O"
#       return "2"
#     elsif board.cells[6] != "X" || board.cells[6] != "O"      
#       return "6"
#     elsif board.cells[8] != "X" || board.cells[8] != "O"      
#       return "8"
#     elsif board.cells[1] != "X" || board.cells[1] != "O"      
#       return "1"
#     elsif board.cells[3] != "X" || board.cells[3] != "O"      
#       return "3"
#     elsif board.cells[5] != "X" || board.cells[5] != "O"      
#       return "5"
#     elsif board.cells[7] != "X" || board.cells[7] != "O"      
#       return "7"
#     end