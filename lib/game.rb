require_all "lib"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =[
    [0,1,2],[3,4,5],[6,7,8], #HORIZONTAL WINNERS
    [0,3,6],[1,4,7],[2,5,8], #VERTICAL WINNERS
    [0,4,8],[2,4,6] #DIAGONAL WINNERS
  ]

  #///CLASS METHODS///#
  def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #///INSTANCE METHODS ///#
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  def over?
    draw? || won?
  end
  def won?
    #if any win combination has the same player token for all positions
    #the game is won
    WIN_COMBINATIONS.find do |win|
      win.all? {|i| board.cells[i] == player_1.token} || win.all? {|i| board.cells[i] == player_2.token}
    end
  end
  def draw?
    @board.full? && !won?
  end
  def winner
    @board.cells[won?[0]] if won?
  end
  def turn
    puts "Please enter a valid move:"
    move = current_player.move(board)
    board.valid_move?(move) == true ? board.update(move,current_player) : turn
  end
  def play
    while !over? 
      turn
    end
  end

end
