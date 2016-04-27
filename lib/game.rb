class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O") && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]}
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
        total_x = @board.cells.select {|i| i == "X"}.count
        total_o = @board.cells.select {|i| i == "O"}.count
        if total_x > total_o
          "X"
        else
          "O"
        end
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
      @board.display
      puts "Upcoming move by Player '#{current_player.token}'."
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
    elsif draw?
      puts "Cats Game!"
      @board.display
    end
  end

end