module Players
  class Computer < Player

    #  WIN_COMBINATIONS = [
    #  [0,1,2],
    #  [3,4,5],
    #  [6,7,8],
    #  [0,3,6],
    #  [1,4,7],
    #  [2,5,8],
    #  [0,4,8],
    #  [6,4,2]
    #  ]
    def move(board)
      self_combo_tracker = []
      opponent_combo_tracker = []
      block_move = 0
      win_move = 0
      if board.valid_move?("5")
      "5"
       # elsif board.valid_move?("1")
       #   "1"
       # elsif board.valid_move?("3")
       #   "3"
       # elsif board.valid_move?("7")
       #   "7"
       # elsif board.valid_move?("9")
       #   "9"    
       # elsif board.valid_move?("2")
       #   "2"
       # elsif board.valid_move?("4")
       #   "4"    
       # elsif board.valid_move?("6")
       #   "6"
       # elsif board.valid_move?("8")
       #   "8"
        else WIN_COMBINATIONS.each do |combo|
          combo.each do |x|
            if board.cells[x] != self.token && board.cells[x] != " "
              opponent_combo_tracker << x 
            elsif board.cells[x] == " "
                
            end
              if opponent_combo_tracker.size == 2


          #  else board.cells[x] == self.token && board.cells[x] == 
          #   self_combo_tracker += 1


        end
      end
    end


  end
end