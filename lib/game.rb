class Game
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize (player_1=nil, player_2=nil, board=nil)
    @board = board || Board.new
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    # make sure player 1 is really X
    if @player_1.token != "X"
      @player_1, @player_2 = @player_2, @player_1
    end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    # f!@*ed up test: this code will detect the 1st win on the board
    # but test gives board with 2 wins.  the first X win is the
    # expected result.   Why would/How can we have a board with 2 wins?
    # WIN_COMBINATIONS.detect do | combo |
    #  @board.cells[combo[0]]!=" " &&
    #  @board.cells[combo[0]]==@board.cells[combo[1]]&&
    #  @board.cells[combo[0]]==@board.cells[combo[2]]
    #end
    winners = WIN_COMBINATIONS.select do | combo |
      @board.cells[combo[0]]!=" " &&
      @board.cells[combo[0]]==@board.cells[combo[1]]&&
      @board.cells[combo[0]]==@board.cells[combo[2]]
    end
    winners.find { | win | @board.cells[win[0]]==@player_1.token} || winners.find { | win | @board.cells[win[0]]==@player_2.token}
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    win = won?
    win ? @board.cells[win[0]] : nil
  end

  def turn
    next_move = -1
    until @board.valid_move?(next_move) do
      next_move = current_player.move(@board).to_i
    end
    @board.update(next_move,current_player)
  end

  def play
    # over? will check for won or draw (full and not won).  This
    # results in extra calls to won? but is required for test specs.
    # All we really need is !won? and !full but spec requires both
    # draw? and over? are called each time through the loop.
    while !over? do
      @board.display
      turn
    end
    @board.display
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
