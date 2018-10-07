require 'pry'
module Players
  class Computer < Player
    attr_accessor :board, :game
    
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board)
      puts "Computer:"
      case 
#check for winning space


#check for spaces to block
      when block(board) != nil
        if board.valid_move?(block(board))
          block(board)
        end
        
#make some other move
      when !board.taken?("5")
        "5"
      else 
        space = (1+rand(9)).to_s
        until board.valid_move?(space)
          space = (1+rand(9)).to_s
        end
        space
      end
    end

  # choose the next move based on current state of the board

    def block(board)
      opponent_token = find_opponent_token
      block_options = []
      WIN_COMBINATIONS.each do |combo| 
        if combo.reject {|i| board.cells[i] == opponent_token}.length == 1
  # try reject if this causes problems
          block_options << combo.detect {|i| board.cells[i] == " "}
        end
      end
      block_move = block_options.first
      if block_move != nil
        (block_move+=1).to_s
      end
      block_move
    end
    
    def find_opponent_token
      if @token == "X"
        "O"
      else
        "X"
      end
    end

  end
end