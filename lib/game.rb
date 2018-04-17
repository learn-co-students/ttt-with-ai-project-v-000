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
    [6,4,2]
  ]
  
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
   end

  def over?
    won? || draw?
  end

  def current_player
   board.turn_count.even? ? player_1 : player_2
  end

  def winner
   board.cells[won?[0]] if won?
  end

  def turn
    puts "It is now #{current_player.token}'s' turn."
    input = current_player.move(board).to_i
    if board.valid_move?(input.to_s)
      board.update(input, current_player)
    elsif input.between?(1, 9) == false
    puts "Invalid move"
    turn
  else
    puts "Position taken."
    turn
  end
  end

  def play
    until over?
      turn
    end
    self.board.display
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |cmb|
    board.cells[cmb[0]] == board.cells[cmb[1]] &&
    board.cells[cmb[1]] == board.cells[cmb[2]] &&
    board.cells[cmb[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end
end 