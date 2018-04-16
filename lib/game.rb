class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(
    player_1 = Players::Human.new("X"),
    player_2 = Players::Human.new("O"),
    board = Board.new
  )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1.token == "X" ? player_1 : player_2
    else
      player_1.token == "X" ? player_2 : player_1
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      streak = @board.cells[combo[0]] + @board.cells[combo[1]] + @board.cells[combo[2]]
      streak == "XXX" || streak == "OOO"
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    win_combo = won?

    if win_combo
      return @board.cells[win_combo[0]]
    else
      nil
    end
  end

  def turn
    @board.display
    current_player.move(@board)
    puts
  end

  def play
    turn while !over?

    if draw?
      @board.display
      puts "Cat's Game!"
    elsif won?
      @board.display
      puts "Congratulations #{winner}!"
    end
  end

  def setup
    print "Choose number of human players: "
    player_num_input = gets.strip
    print "Will player 1 or player 2 go first? "
    player_order_input = gets.strip

    if player_num_input =~ /[0-2]/ && player_order_input =~ /[1-2]/
      num_players = player_num_input.to_i
      first_player = player_order_input.to_i

      if num_players == 2 && first_player == 2
        @player_1 = Players::Human.new("O")
        @player_2 = Players::Human.new("X")
      elsif num_players == 1 && first_player == 1
        @player_2 = Players::Computer.new("O")
      elsif num_players == 1 && first_player == 2
        @player_1 = Players::Human.new("O")
        @player_2 = Players::Computer.new("X")
      elsif num_players == 0 && first_player == 1
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
      elsif num_players == 0 && first_player == 2
        @player_1 = Players::Computer.new("O")
        @player_2 = Players::Computer.new("X")
      end
    else
      setup
    end
  end

  def start
    puts " /-----------\\"
    puts "| Tic Tac Toe |"
    puts " \\-----------/"
    puts

    setup
    play

    puts
    print "Play again (y/n)? "
    play_again = gets.strip

    if ["y", "Y", "yes", "Yes", "YES"].include?(play_again)
      @board.reset!
      start
    end
  end

end
