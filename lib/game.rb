class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], #bot row
    [0,4,8], #\ diag
    [2,4,6],  # / diag
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8] #right col
  ]

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]] == @board.cells[combination[2]]
        if @board.cells[combination[0]] == "X" || @board.cells[combination[0]] == "O"
          return combination
        end
      end
    end
    return false
  end

  def draw?
    board.full? && won? == false
  end

  def over?
    draw? || won? != false
  end

  def winner
    won = won?
    if won != false
      return @board.cells[won[0]]
    else
      return nil
    end
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      move
    else
      puts "Invalid move!"
      turn
    end
  end

  def play
   until(over?)
     turn
     board.display

   end
   if won? != false
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
