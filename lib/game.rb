class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # 1st Column
    [1,4,7], # 2nd Column
    [2,5,8], # 3rd Column
    [0,4,8], # Diagonal 1
    [2,4,6]  # Diagonal 2
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 =player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if combo.all? {|s| @board.cells[s] == "X"} || combo.all? {|s| @board.cells[s] == "O"}
        combo
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if combo = won?
      @board.cells[combo.first]
    end
  end

  def turn
    puts "#{current_player.token}'s turn."
    input = current_player.move(board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, current_player)
      @board.display
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
