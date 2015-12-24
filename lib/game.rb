
class Game
  attr_accessor :board, :player_1, :player_2, :winner, :current_player, :move

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


  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @turn_count = 0
  end
  

  def current_player
    (board.turn_count + 1) % 2 == 0 ? @player_2 : @player_1
  end

  def over?
    won? || draw?
  end

  def won?
    @winning_array = WIN_COMBINATIONS.detect{|a| 
      a.all?{|p| board.cells[p] == "X" } || a.all?{|p| board.cells[p] == "O" }
      } 
    @winning_array ? true : false
  end

  def draw?
    !won? && board.full?
  end

  def winner
    won? ? board.cells[@winning_array[0]] : nil
  end

  def turn
    puts "\e[H\e[2J"
    board.display
    @move = current_player.move(current_player.token)
    if board.valid_move?(@move)
      board.update(@move, current_player)
    else
      "invalid"
      turn
    end
  end

  def play
    until over?
      turn
    end
    puts "\e[H\e[2J" 
    board.display
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
    puts "Play again?"
      a = gets.strip.downcase
      if a == "y"
        puts "YASSS"
        TTTController.new
      else
        puts "So long, schmuck."
      end
        
  end
    

end