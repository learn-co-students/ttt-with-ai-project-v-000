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
  
  def self.setup(num_of_players)
    if num_of_players.to_i == 2
      game = Game.new
    elsif num_of_players.to_i == 1 
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    else num_of_players.to_i == 0
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    end
    game
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
    num = nil
    until board.valid_move?(num)
        num = current_player.move(board)
    end 
    board.update(num, current_player)
    board.display
  end
  
  def play
    until over?
      turn
    end 
    puts "Cat's Game!" if draw?
    puts "Congratulations #{winner}!" if won?
  end

end 


# learn --fail-fast
