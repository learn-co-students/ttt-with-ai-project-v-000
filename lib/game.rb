class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full? || won?
  end

  def won?
    if WIN_COMBINATIONS.any? {|combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "}
      true
    else
      false
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    if @board.cells.count("X") > @board.cells.count("O")
      "X"
    elsif @board.cells.count("X") < @board.cells.count("O")
      "O"
    else
      nil
    end
  end

  def turn
    puts "It is #{current_player.token}'s turn."
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      turn
    end
  end

  def play
    turn
    if over?
      if draw?
        puts "Cats Game!"
      else
        puts "Congratulations #{winner}!"
        @board.display
      end
    else
      @board.display
      play
    end
  end
      

end