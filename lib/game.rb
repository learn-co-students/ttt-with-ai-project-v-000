class Game
  attr_accessor :board, :player_1, :player_2, :winner, :current_player

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    n = @board.turn_count
    if n.even?
      @player_1
    elsif n == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    if won? != nil
      true
    elsif draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|n| @board.cells[n] == "X"}
        @winner = "X"
        return combo
      elsif combo.all?{|n| @board.cells[n] == "O"}
        @winner = "O"
        return combo
      end
    end
    return nil
  end

  def draw?
    true if (won? == nil && @board.full?)
  end

  def winner
    if won? != nil
      @winner
    end
  end

  def start

  end

  def play
    if !over?
      turn
      play
    elsif over?
      if won? != nil
        puts "Congratulations #{@winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end

  def turn
    @current_player = self.current_player
    eve = @current_player.move(@board)
    if @board.valid_move?(eve)
      @board.update(eve, @current_player)
    else
      turn
    end
  end
end
