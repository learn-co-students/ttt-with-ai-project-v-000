
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


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

  def current_player
    if @board.turn_count.even?
      @player_1
    elsif @board.turn_count.odd?
      @player_2
    end
  end


  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect {|i| @board.cells[i[0]] == @board.cells[i[1]] && @board.cells[i[1]] == @board.cells[i[2]] && @board.taken?(i[0]+1)}
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      champ = won?
      board.position(champ[0]+1)
    end
  end

  def turn
    puts "Its #{current_player.token}'s turn"
    @board.display
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      puts "#{input} Invalid move!"
      turn
    elsif @board.valid_move?(input)
      @board.update(input, current_player)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
    elsif draw?
      puts "Cat's Game!"
      @board.display
    end
  end

end
