require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  @@games_played = []
  @@games_won = []

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [2,4,6], # Top right to bottom left
  [0,4,8]  # Top left to bottom right
]

  # Did not know you can create the player right in the initialize argument.
  # Pretty neat.
  def initialize(player_1 = Player::Human.new("X"), player_2 =    Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board.cells[win_index_1]
    position_2 = board.cells[win_index_2]
    position_3 = board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  nil
end

  def draw?
    board.full? && !won?
  end

  def winner
    !won? ? nil : board.cells[won?.first]
  end

  def turn
    position = current_player.move(board, self)
    if board.valid_move?(position)
      board.update(position, current_player)
      board.display
    else
      turn
    end
  end

  def play
    while board.turn_count < 9 && !over?
      turn
    end
    if over?
      case draw?
      when true
        puts "\033[1;40;31mCat's Game!\033[0m"
      when false
        puts "\033[1;40;36mCongratulations #{winner}! You won in #{board.turn_count} turns!\033[0m"
      end
      play_again?
    end
  end

  def wargames
    while board.turn_count < 9 && !over?
      turn
    end
    if over?
      @@games_played << 1
      case draw?
      when true
        puts "\033[1;40;31mCat's Game!\033[0m"
        puts "Games played: #{@@games_played.size}. Games won: #{@@games_won.size}."
      when false
        @@games_won << 1
        puts "\033[1;40;36mCongratulations #{winner}! You won in #{board.turn_count} turns!\033[0m"
        puts "Games played: #{@@games_played.size}. Games won: #{@@games_won.size}."
      end
    end
  end

  def play_again?
    puts "Would you like to play again?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      system "ruby bin/tictactoe"
    else
      puts "Goodbye!"
    end
  end
end
