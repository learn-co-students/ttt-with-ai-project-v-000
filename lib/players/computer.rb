class Player::Computer < Player
  attr_accessor :choice, :input, :board
  
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

  def move(board)
    position = random(board)
  end

  def random(board)
    position = rand(1..9).to_s
    board.valid_move?(position) ? position : random(board)
  end

  def movex(board) 
    c = board.cells
    WIN_COMBINATIONS.detect do |i|
    if c[i[0]] == c[i[1]] && c[i[1]] == c[i[2]]
      avoid = c[i[0]]
    if avoid == "X"
      "O"  
    else
      "X"
        end
      end
    end
  end
end
