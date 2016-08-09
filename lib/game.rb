class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
  end

  def get_players
    puts "How many players would you like to have?"
    player_count = gets.chomp
    if player_count == "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    elsif player_count == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    elsif player_count == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    else
    get_players
    end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full? || won?
  end

  def won?
    WIN_COMBINATIONS.any? {|combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "}
  end

  def draw?
    over? && !won?
  end

  def winner
    if @board.cells.count("X") > @board.cells.count("O") && won?
      "X"
    elsif @board.cells.count("X") < @board.cells.count("O") && won?
      "O"
    else
      nil
    end
  end

  def turn
    puts "It is #{current_player.token}'s turn."
    move = current_player.move(Marshal.load(Marshal.dump(self)))
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      turn
    end
  end

  def play
    turn unless over?
    if over?
      if draw?
        puts "Cats Game!"
      else
        puts "Congratulations #{winner}!"
      end
      @board.display
    else
      @board.display
      play
    end
  end

  def get_available_moves
    (1..9).to_a.select{ |move| @board.valid_move?(move) }
  end
      

end