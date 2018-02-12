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
  [2,4,6]
]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  #State of the current game
  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.cells[combination[0]] != " "
    end
  end

  def draw?
    !won? && @board.turn_count == 9
  end

  def winner
    if over? && !draw?
      @board.cells[won?[0]]
    end
  end

  #Managing a game
  def start

  end

  def turn
    move_location = current_player.move(@board)
      if !@board.valid_move?(move_location)
        move_location = current_player.move(@board)
      end
    @board.update(move_location, current_player)
    @board.display
  end

  def play
    #binding.pry
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      if won? != nil
        puts "Congratulations #{winner}!"
      end
    end
  end



end
