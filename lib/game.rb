require_relative "players/human.rb"
require_relative "players/computer.rb"
require_relative "board.rb"


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

  def initialize(player_1=Human.new("X"), player_2=Computer.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board  
  end

  def board
    @board
  end

  def player_2
    @player_2
  end

  def player_1
    @player_1
  end

  def current_player
    if ((@board.turn_count)+2) % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.position(combo[0]+1) == @board.position(combo[1]+1) &&
      @board.position(combo[1]+1) == @board.position(combo[2]+1) &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && won? == nil
  end

  def over?
    won? || draw?
  end

  def winner
    if won? != nil
      @board.cells[won?.first]
    else
      nil
    end
  end

  def turn
    @board.display
    puts "Please enter 1-9"
    player = current_player
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, player)
    end
    #@board.display
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      @board.display
      puts "Congratulations #{winner}!"
    end
    new_game?
  end

  def new_game?
    puts "Would you like to play a new game? (y/n)"
    answer = gets.chomp
    if answer == "y"
      @board.reset!
      play
    end
  end

end