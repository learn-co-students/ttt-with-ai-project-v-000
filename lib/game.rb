class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @win = []
  end

  def current_player
    @board.turn_count % 2 == 0? @player_1 : @player_2
  end


  def won?
    board.won?
  end

  def draw?
    board.draw?
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    board.winner
  end


  def turn
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play()
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner()}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end