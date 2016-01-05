class Player::Computer < Player
  attr_accessor :moves

  def initialize(token)
    @token = token
    @win = []
    @block = []
    @moves = []
  end
  
  def valid_moves(board) #Valid moves are identified as blank spaces and saved in an array
    board.cells.each do |space|
      if space  == " " 
        @moves << space
      end 
    end
  end

  def move_to_win(board)
    my_spaces = []
    board.cells.each do |space|
      if space  == @token
        my_spaces << space
      end 
    end
      Game::WIN_COMBINATIONS.detect do |possibility| 
      if @win = possibility - my_spaces
        return (@win.first + 1).to_s

      else
        move_to_block(board)
      end
    end
  end

  def move_to_block(board)
    opponent_spaces = []
    board.cells.each do |space|
      if space  == !@token && space != " " 
        opponent_spaces << space
      end 
    end
    Game::WIN_COMBINATIONS.detect do |possibility| 
      if @block = possibility - opponent_spaces
        return (@block.first + 1).to_s
      else
        (@moves.first + 1).to_s
      end
    end
  end  

  
  def move(board)
    move_to_win(board)
  end

end




