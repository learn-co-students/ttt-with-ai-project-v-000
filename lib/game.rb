class Game
  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def current_player
    if @board.turn_count.+(1).odd?
      @player_1
    else
      @player_2
    end
  end
  def over?
    true if draw? || won?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
        @winner = @board.cells[combo[0]]
        true
      else
        @winner = nil
        false
      end
    end
  end
  def draw?
      @board.full? && !won?
  end
  def winner
    if won?
      return "#{@winner}"
    else
      return nil
    end
  end
   def turn
    player = current_player
    move = player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      @board.update(move, player)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{@winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end