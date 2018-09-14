require "pry"
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

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

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    #this method returns the array index that created the win (i.e. because the find renumerable returns the first block that is not false).
    #if the game has not been won - the return value is nil
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[0]+1) == true
    end

  end

  def draw?
    #Need to be careful of the disctinction between nil and false
    #If a player has not won, won? = nil, !won? = true
    #If a player has won, won? = array, !won? = false

    board.full? == true && won? == nil
  end

  def over?
    !won? == false || draw? == true
  end

  def winner
    if won? != nil
    # won?[0] gives the board index for the first winning position.
    board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    #asks player for their move
    move = current_player.move(board)
    if board.valid_move?(move) != true
      #this is not a valid move - ask player again for input
      turn
    else
      #update the board
      board.update(move, player)
    end
  end

  def play
    while !over?
    turn
    end

    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
