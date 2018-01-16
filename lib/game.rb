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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    (@board.turn_count % 2 == 0) ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      (@board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X") || (@board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O")
    end
  end

  def draw?
    @board.full? && won? == (false || nil)
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(@board)
    player = self.current_player
    if self.board.valid_move?(input)
      self.board.update(input, player)
      self.board.display
    else
      turn
    end
  end

  def start
    puts "Would you like to play a 0, 1, or 2 person game?"
    init_input = gets.strip
    if init_input == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    elsif init_input == "1"
      go_first?
      # @player_1 = Players::Human.new("X")
      # @player_2 = Players::Computer.new("O")
    elsif init_input == "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    end
  end

  def go_first?
    puts "Would you like to go first? Y/N"
    1p_input = gets.strip.capitalize
    if 1p_input == "Y"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    elsif 1p_input == "N"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Human.new("O")
    else
      puts "I'm sorry, I'm not that smart."
      puts "Please enter either Y or N:"
      go_first?
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
