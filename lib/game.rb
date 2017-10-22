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
    [6,4,2]]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0? @player_1 : @player_2
  end

  def draw?
    !won? && @board.full?
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

  def over?
    won? || draw?
  end

  def turn
    player = current_player
    current_move= player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.display
      @board.update(current_move, player)
      @board.display
    end
  end


  def winner
    if won?
      combination = won?
      @board.position(combination[0]+1)
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combination|
        @board.position(combination[0]+1) == @board.position(combination[1]+1) &&
        @board.position(combination[1]+1) == @board.position(combination[2]+1) &&
        @board.taken?(combination[0]+1)
      end
  end



end
