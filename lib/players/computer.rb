module Players
  
  class Computer < Player
    
    CORNERS = ["1","3","7","9"]
    EDGES   = ["2","4","6","8"]
    
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # row
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # col
      [0, 4, 8], [2, 4, 6]             # diag
      ]
    
    def move(board)
      
      # logic below leaves simulator vulnerable to "forking"
      
      # grab board positions for self and opponent
      pos = board.positions(self.token)
      opp_token = ( self.token=="X" ? "O" : "X" )
      opp = board.positions(opp_token)
      
      # opening move (random corner)
      if ( pos.empty? && opp.empty? )
        return ( CORNERS[rand(0..3)] )
      end
      
      # opening response (center or random corner)
      if ( pos.empty? && opp.size==1 )
        return ( opp[0]==4 ? CORNERS[rand(0..3)] : "5" )
      end
      
      # winning move for tic-tac-toe
      mov = WIN_COMBINATIONS.select{|win| win-pos if (win-pos).size==1}.flatten
      unless mov.empty?
        mov.each{|i| return (i+1).to_s if board.valid_move?((i+1).to_s)}
      end
      
      # block opponent's tic-tac-toe
      blk = WIN_COMBINATIONS.select{|win| win-opp if (win-opp).size==1}.flatten
      unless blk.empty?
        blk.each{|i| return (i+1).to_s if board.valid_move?((i+1).to_s)}
      end
      
      # prioritize center then corners then edges
      priority_arr = ["5"] + CORNERS.shuffle + EDGES.shuffle
      priority_arr.each{|s| return s if board.valid_move?(s)}
      
    end
  end
end