class Game
  
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] \
      && @board.cells[win_combination[2]] == @board.cells[win_combination[1]] \
      && @board.cells[win_combination[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if winning_combination = won?
      @board.cells[winning_combination[0]]
    end
  end

  def turn
    @board.display
    player = current_player
    current_move = player.move(@board)

    if current_move == 'exit'
      puts 'Goodbye!'
      exit
    end

    if !@board.valid_move?(current_move)
      puts "Invalid move, try again."
      turn
    else
      @board.update(current_move, player)
      puts "#{player.token}'s turn"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      @board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      @board.display
      puts "Cat's Game!"
    end
  end
end
