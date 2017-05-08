class Game
  include Constable

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    return player_1 if board.turn_count.even?
    player_2
  end

  def over?
    won? || draw?
  end

  def won?
    b = board.cells
    WIN_COMBINATIONS.detect do |c|
      b[c[0]] == b[c[1]] && b[c[1]] == b[c[2]] && b[c[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    puts "Turn: #{board.turn_count + 1}"
    puts "#{current_player.token} make your move."
    board.display
    puts "\n"
    user_input = current_player.move(board)
    turn unless board.valid_move?(user_input)
    board.update(user_input, current_player)
    board.display
    puts "\n"
    puts "---------------------"
    puts "\n"
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def config_players
    puts "Enter number of players: 0, 1, 2:"
    input = gets.chomp
    case input
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    when "1"
      @player_2 = Players::Computer.new("O")
      config_difficulty
    when "2"
      nil # 2 human players is default in init
    else
      puts "Does not compute"
      config_players
    end
  end

  def config_difficulty
    puts "Select difficulty level\n1. Easy\n2. Moderate\n3. Mission Impossible"
    input = gets.chomp
    case input
    when "1"
      player_2.difficulty = "easy"
    when "2"
      player_2.difficulty = "moderate"
    when "3"
      player_2.difficulty = "hard"
    else
      puts "Does not compute"
      config_difficulty
    end
  end
end
