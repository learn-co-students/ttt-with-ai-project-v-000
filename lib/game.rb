# The Game class is the main model of the application and represents a singular instance of a Tic Tac Toe session.

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
    [6,4,2]
  ]
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # count moves made
    # even? Player 1 is next
    # odd? player 2
    if self.board.turn_count.even? 
      player_1 
    else
      player_2
    end
  end

    def over?
      won? || draw?
    end

    def won?
      WIN_COMBINATIONS.detect do |possibility|
        (board.cells[possibility[0]] == board.cells[possibility[1]] && 
        board.cells[possibility[1]] == board.cells[possibility[2]]) && 
        board.cells[possibility[0]] != " "
      end
    end

    def draw?
      board.full? && !won?
    end

    def winner
     board.cells[won?[0]] if won?
   end

   def turn
    play = current_player.move(board)
    if board.valid_move?(play)
      board.update(play, current_player)
    else
      turn
    end
   end

   def play
    until over?
      turn
      board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end

  

end
