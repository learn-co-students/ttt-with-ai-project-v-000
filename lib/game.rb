class Game 

  attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), b = Board.new)
    @board = b
    @player_1 = p1
    @player_2 = p2
  end
  
  def current_player
    if board.turn_count.even?
      @player_1 
    else 
      @player_2
    end
  end 
  
  def won? 
    WIN_COMBINATIONS.detect {|wc| 
    ck = []
    ck << board.cells[wc[0]]
    ck << board.cells[wc[1]]
    ck << board.cells[wc[2]]
    wc if ck.all? {|x|  x == "X"} || ck.all? {|o| o == "O"}}
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over? 
    draw? || won?
  end 
  
  def winner 
    board.cells[won?[0]] if won? 
  end
  
  def turn 
    num = gets
    #move(num) if valid_move?(num)
    #num
  end
end 


# learn --fail-fast
