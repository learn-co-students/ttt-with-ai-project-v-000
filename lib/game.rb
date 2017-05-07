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
  ].freeze

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

  # TODO: refactor
  def won?
    i = 0
    is_won = false
    while i < WIN_COMBINATIONS.size && is_won != true
      hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
      is_won = hold.uniq.size == 1 && !hold.include?(" ")
      i += 1
    end
    is_won
  end

  def draw?
    board.full? && !won?
  end

  # TODO: refactor
  # BUG: This returned Congrats X
  #  X | O | X
  # -----------
  # " "| O |" "
  # -----------
  # " "| O | X
  def winner
    hold = nil
    winner_found = false
    if won?
      i = 0
      while i < WIN_COMBINATIONS.size && !winner_found
        hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
        if hold.all? && !hold.include?(" ")
          hold = hold[0]
          winner_found = true
        end
        i += 1
      end
    end
    hold
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
