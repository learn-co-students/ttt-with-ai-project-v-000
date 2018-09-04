module Players
  class Computer < Player
    attr_reader :board
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
    
    def move(board)	
    if !board.taken?('5')	
      '5'	
    else	
      best_move(board) + 1	
    end	
  end	
   
   def best_move(board)	
    win(board) || corner(board) || random	|| block(board)
  end
  
    def corner(board)
      corners = [0,2,6,8]
      corners.detect {|cell| !board.taken?(cell + 1)}
    end
    
    def complete_combination?(board, token)
      Game::WIN_COMBINATIONS.detect do |combination|
        ((board.cells[combination[0]] == token && board.cells[combination[1]] == token) && !board.taken?(combination[2]+1)) ||
        ((board.cells[combination[1]] == token && board.cells[combination[2]] == token) && !board.taken?(combination[0]+1)) || 
        ((board.cells[combination[0]] == token && board.cells[combination[2]] == token) && !board.taken?(combination[1]+1))
  end
end
    
    def win(board)
      winning_combination = complete_combination?(board, self.token)
      if winning_combination && winning_combination.count  {|index| board.position(index+1) == self.token} == 2
          puts "Winning Combination #{winning_combination}"
          winning_combination.detect {|index| !board.taken?(index+1)}
        end
      end
    end
    
    def block(board)
      blocking_combination = complete_combination?(board, self.opponent_token)
      if blocking_combination && blocking_combination.count {|index| board.position(index+1) == self.opponent_token} == 2 
        puts "Blocking Combination #{blocking_combination}" 
        blocking_combination.detect {|index| !board.taken?(index+1)}
      end
    end
    
    def opponent_token
      if self.token == "X" 
        opponent_token = "O"
      else 
        opponent_token = "X"
      end
    end
      
    def random
      (0..8).to_a.sample
    end
end

                 

