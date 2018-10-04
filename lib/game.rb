class Game
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

  attr_accessor :board, :player_1, :player_2

  def self.set_up
    puts "How many players are playing this time? 0, 1, or 2?"
    num_players = gets.strip.to_i
    case num_players
    when 0
      game = new(Players::Computer.new("X"), Players::Computer.new("O"))
    when 1
      puts "Do you want to be player X and start the match? Y/N"
      input = gets.strip
      if input == "Y"
        game = new(Players::Human.new("X"), Players::Computer.new("O"))
      elsif input == "N"
        game = new(Players::Computer.new("X"), Players::Human.new("O"))
      end
    when 2
      game = new
    end
  end

  def self.play_again
    puts "Want to play again? Y/N"
    input = gets.strip
    if input == "Y"
      puts "That's the spirit. Here we go again!"
      set_up.play
      play_again
    elsif input == "N"
      puts "Alrighty, see you next time!"
      exit
    end
  end

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] != " " &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def start
    puts "Ohhh, sounds like an interesting match..."
    puts "Here's the board:"
    board.display
    puts "\n\n"
  end

  def play
    start
    until over?
      puts "Player #{current_player.token}, it's your turn!"
      turn
      puts "A move was made!"
      board.display
      puts "\n\n"
    end
    puts "The game is over..."
    board.display
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
