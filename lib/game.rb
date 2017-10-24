require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner
  attr_reader :game_type
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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # Game State methods:
  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end

  # Managing the game methods
  def start
    puts "Welcome to Tic-Tac-Toe!"
    puts "What kind of game do you want to play? Please enter 1-3. Here are the game options"
    puts "1 = two computers"
    puts "2 = one human, one computer"
    puts "3 = two humans"
    @game_type = gets.strip
    # If both players are computers
    if @game_type.include?("1" || "two computers")
        self.player_1 = Players::Computer.new("X")
        self.player_2 = Players::Computer.new("O")
    # If one player is a computer and one is a human
  elsif @game_type.include?("2" || "one human" || "one computer")
      puts "Who should go first and be X: human or computer?"
        first_player = gets.strip
        if first_player.include?("human")
          self.player_1 = Players::Human.new("X")
          self.player_2 = Players::Computer.new("O")
        else
          self.player_1 = Players::Computer.new("X")
          self.player_2 = Players::Human.new("O")
        end
    # If both players are human
  elsif @game_type.include?("3" || "two humans")
    # validation
    else
      puts "Please pick a valid option!"
    end

    self.play

    puts "Would you like to play again? Y/N?"
      answer = gets.strip
      if answer.downcase == "y"
        game = Game.new
        game.start
      else
        puts "Thanks for playing! Goodbye!"
      end
  end

  def play
    while !over?
      turn
      sleep(1)
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    board.display
    this_move = current_player.move(board)
    if !board.valid_move?(this_move)
      puts "invalid"
      turn
    end
    puts "#{current_player.token}'s move:"
    board.update(this_move, current_player)
  end
end

# def play_again
#   puts "Would you like to play again? Y/N?"
#     answer = gets.strip
#     if answer.downcase == "y"
#       game.start
#     else
#       puts "Thanks for playing! Goodbye!"
#     end
# end
