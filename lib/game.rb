class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

#   def self.start
#   puts "Welcome to Tic Tac Toe!" # Greet the user with a message.
#   puts "Please type 0, 1, or 2 players." # Prompt the user for what kind of game they want to play, 0,1, or 2 player.
#   players = gets.strip[0].to_i
#   if players == 2
#     self.new
#   elsif players == 1
#     puts "Do you want to make the first move? (Y/N)" # Ask the user for who should go first and be "X".
#     first_move = gets.strip
#     if first_move == "Y"
#       self.new(Player::Human.new("X"), Player::Computer.new("O"))
#     else
#       self.new(Player::Computer.new("X"), Player::Human.new("O"))
#     end
#   else
#     self.new(Player::Computer.new("X"), Player::Computer.new("O"))
#   end
#   puts "Do you want to play again? (Y/N)"
#   play_again = gets.strip
#   if play_again == Y
#     self.start
#   else
#     puts "Thanks for playing. See you next time!"
#   end
# end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| (board.cells[combo[0]] == "X" || board.cells[combo[0]] == "O") && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]}
  end

  def draw?
    board.full? && !self.won?
  end

  def winner
    if self.won?
      WIN_COMBINATIONS.collect do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
          board.cells[combo[0]]
        end
      end.compact.uniq.join().gsub(" ","")
    else
      nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

# Game.start