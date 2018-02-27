class Game
  attr_accessor :player_1, :player_2, :board
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
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

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != " "
    end
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def turn
    @board.display
      if current_player == player_1
        #call Player.move
        input = @player_1.move(@board)
        if @board.valid_move?(input)
          @board.update(input, player_1)
        else
          puts "Invalid move"
          turn
        end
      elsif current_player == player_2
        input = @player_2.move(@board)
        if @board.valid_move?(input)
          @board.update(input, player_2)
        else
          puts "Invalid move"
          turn
        end
      end
  end

  def play
    until over?
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
