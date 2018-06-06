
class Game
  include Players
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def initialize(p1 = Human.new('X'), p2 = Human.new('O'), board = Board.new)
    self.board = board
    self.player_2 = p2
    self.player_1 = p1
  end
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |set|
      if board.cells[set[0]] == "X" && board.cells[set[1]] == "X" && board.cells[set[2]] == "X"
        result = set
        break
      elsif board.cells[set[0]] == "O" && board.cells[set[1]] == "O" && board.cells[set[2]] == "O"
        result = set
        break
      end
    end
    result
  end

  def draw?
    won? == false && board.full?
  end
  
  def over?
    won? != false || draw?
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
  
  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      turn
    end
  end
  
  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end



