module Players
  
  class Computer < Player
    
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
      ]
    
    def move(board, player=nil)
      
      pos = board.positions(player)
      opp_token = ( player.token=="X" ? "O" : "X" )
      opp = board.cells.collect.with_index{|tok,i| i if tok==opp_token}.compact
      
      #0.(a) opening move
      if ( pos.empty? && opp.empty? )
        return ( ["1","3","5","7","9"][rand(0..4)] )
      end
      
      #0.(b) opening response
      if ( pos.empty? && opp.size==1 )
        return ( opp[0]==4 ? ["1","3","7","9"][rand(0..3)] : "5" )
      end
      
      #1. obtain tic-tac-toe
      mov = WIN_COMBINATIONS.select{|win| win-pos if (win-pos).size==1}.flatten
      mov.each{|i| return (i+1).to_s if board.valid_move?((i+1).to_s)} if !mov.empty?
      
      #2. prevent tic-tac-toe
      blk = WIN_COMBINATIONS.select{|win| win-opp if (win-opp).size==1}.flatten
      blk.each{|i| return (i+1).to_s if board.valid_move?((i+1).to_s)} if !blk.empty?
      
      #3. corners
      ["1","3","7","9"].shuffle.each{|s| return s if board.valid_move?(s)}
      
      #4. center
      return "5" if board.valid_move?("5")
      
      #5. rand
      rand(1..9).to_s
      
    end
  end
end