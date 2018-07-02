class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6], # Right diagonal
  ]
  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end
  def current_player
    (board.turn_count+1).odd? ? player_1 : player_2
  end
  def won?
    won = false
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == player_1.token && @board.cells[combo[1]] == player_1.token && @board.cells[combo[2]] == player_1.token
        won = combo
      elsif @board.cells[combo[0]] == player_2.token && @board.cells[combo[1]] == player_2.token && @board.cells[combo[2]] == player_2.token
        won = combo
      end
    end
    won
  end

  def draw?
    full = board.full?
    won = won?
    if full && !(won)
      true
    elsif won
      false
    elsif !(full) && !(won)
      false
    end
  end

  def over?
    if won? || draw? || board.full?
      true
    else
      false
    end
  end

  def winner
    winner = nil
    won = won?
    if won != false
      if @board.cells[won[0]] == player_1.token
        winner = player_1.token
      else
        winner = player_2.token
      end
    end
    winner
  end

  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move,current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
