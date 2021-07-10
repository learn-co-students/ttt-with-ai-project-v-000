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
    [2,4,6],
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|play| @board.cells[play] == "X"} || combo.all? {|play| @board.cells[play] == "O"}
        return combo
      end
    end
    false
  end

  def draw?
    !@board.cells.include?(" ") && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won = won?
      @board.cells[won.first]
    end
  end

  def turn(board = @board)
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, current_player)
    end
    @board.display
  end

  def play
    turn while !over?
    puts "Congratulations #{winner}!" if winner
    puts "Cat's Game!" if draw?
  end

  def start
    play
  end

end
