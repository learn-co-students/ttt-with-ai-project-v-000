module Players
  class Computer < Player
    def move(board)
      win_combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
      corners = [1, 3, 7, 9]
      self.token == "X" ? opposite_player = "O" : opposite_player = "X"

      ## 0 IMPORTANCE - random move
      move = rand(1...10).to_s
      while board.taken?(move)
        move = rand(1...10).to_s
      end

      ## 1 IMPORTANCE - empty corner
      corners.each do |corner|
        move = corner unless board.taken?(corner)        
      end

      ## 2 IMPORTANCE - opposite corner
      if board.cells[8] == opposite_player
        move = "1" unless board.taken?(1)
      elsif board.cells[0] == opposite_player
        move = "9" unless board.taken?(9)
      elsif board.cells[6] == opposite_player
        move = "3" unless board.taken?(3)
      elsif board.cells[2] == opposite_player
        move = "7" unless board.taken?(7)
      end
      
      ## 3 IMPORTANCE - CENTER
      move = "5" unless board.taken?(5)

      ## 4 & 5 - Blocking and Creating Fork - Not Implemented
      
      ## 6 IMPORTANCE - BLOCKING A WIN
      blocking_value = win_combos.detect do |combo|
        board.cells[combo[0]] == opposite_player && board.cells[combo[1]] == opposite_player ||
        board.cells[combo[1]] == opposite_player && board.cells[combo[2]] == opposite_player ||
        board.cells[combo[2]] == opposite_player && board.cells[combo[0]] == opposite_player
      end

      if blocking_value        
        blocking_move_one = blocking_value[0] + 1
        blocking_move_two = blocking_value[1] + 1
        blocking_move_three = blocking_value[2] + 1              
        move = blocking_move_one.to_s unless board.taken?(blocking_move_one.to_s)
        move = blocking_move_two.to_s unless board.taken?(blocking_move_two.to_s)
        move = blocking_move_three.to_s unless board.taken?(blocking_move_three.to_s)     
      end
   
      # 7 IMPORTANCE - WINNING IF POSSIBLE
      value = win_combos.detect do |combo|
        board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token ||
        board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token ||
        board.cells[combo[2]] == self.token && board.cells[combo[0]] == self.token
      end
      if value
        move_one = value[0] + 1
        move_two = value[1] + 1
        move_three = value[2] + 1              
        move = move_one.to_s unless board.taken?(move_one.to_s)
        move = move_two.to_s unless board.taken?(move_two.to_s)
        move = move_three.to_s unless board.taken?(move_three.to_s)     
      end
      move
    end
  end
end