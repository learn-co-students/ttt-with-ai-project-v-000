class Game
  attr_accessor :board, :player_1, :player_2, :human_token

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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.x_count > @board.o_count
      @player_2
    else
      @player_1
    end
  end

  def over?
    won? || draw?
  end


  def won?
     WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0]+1)
    end

  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    player = self.current_player
    current_move = player.move(board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      puts "Turn: #{@board.turn_count}\n"
      @board.display
      puts "\n\n\n"
    else
      turn
      puts "Invalid move, try again."
      puts "\n\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end



end