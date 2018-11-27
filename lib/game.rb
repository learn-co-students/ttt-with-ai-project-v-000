class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect{|c|
      (board.cells[c[0]] == "X" && board.cells[c[1]] == "X" && board.cells[c[2]] == "X") || (board.cells[c[0]] == "O" && board.cells[c[1]] == "O" && board.cells[c[2]] == "O")}
  end
  
  def draw?
    if board.full? && won? == nil
      true
    else
      false
    end
  end
  
  def over?
    (draw? == true && board.full?) || won? != nil
  end
  
  def winner
    if won?
      if board.cells.count {|position| position == "X"} > board.cells.count {|position| position == "O"} then "X"
      else "O"
      end
    end
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end
  
  def start
    
  end
  
  def play
    if over?
      if won?
        winner
      end
    else
      turn
      play
    end
  end
  
end