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
    [2,4,6]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|i| @board.cells[i] == "X"} || win.all? {|i| @board.cells[i] == "O"}
        return win
      end
    end
    return false
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      combination = won?
      if combination.all? {|i| @board.cells[i] == "X"}
        return "X"
      else
        return "O"
      end
    else
      return nil
    end
  end

  def turn
    player = current_player
    @board.display
    move = player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      @board.update(move, player)
      @board.display
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
