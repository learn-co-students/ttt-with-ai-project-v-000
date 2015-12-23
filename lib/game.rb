
class Game
  attr_accessor :board, :player_1, :player_2, :winner, :current_player

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


  def initialize(player_1="X", player_2="O", board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @turn_count = 0
  end
  

  def current_player
    board.turn_count % 2 == 0 ? @player_2 : @player_1
  end

  def over?
    board.full?
  end

  def won?
    @winner = WIN_COMBINATIONS.detect{|a| 
      a.all?{|p| board.cells[p] == "X" || board.cells[p] == "O"}
      }
    @winner ? true : false
  end

  def draw?
    !won? && over?
  end

  def winner
    "#{@winner[0]} wins!" if won?
  end

  def turn(move, player)
    if board.valid_move?(move) 
      board.update(move, player)
      won? ? winner : current_player
      full? ? "It's a draw" : turn
    else
      "Look, it's a grid with numbered squares.\nHow hard can it be?"
      turn
    end

  end

  def play
    player = current_player
    puts "Player #{player}, make your move."
    move = gets.strip
    turn(move, player)
  end

end