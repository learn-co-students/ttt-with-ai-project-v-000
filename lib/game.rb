require 'pry'
class Game

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],[6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8]
  ]
  attr_accessor :board, :player_1, :player_2


def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
  @player_1.board = @board
  @player_2.board = @board

end


  def current_player #i.e. to next player to play
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    position_taken = [[],[]]
    @board.cells.each_with_index do |cell, i|
       position_taken[0] << i if cell == "X"
       position_taken[1] << i if cell == "O"
     end
     winning_combo = false
    WIN_COMBINATIONS.each do |combo|
     winning_combo = combo if (combo - position_taken[0]).empty? || (combo - position_taken[1]).empty? # if combo is included in position_taken
    end
    winning_combo
  end


  def draw?
    @board.full? && !won?
  end

  def winner
    if won? == false
      nil
    else
      @board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(@board)
    # if current_player.class == Players::Computer
    #   current_player.opponent_has_2?(@board)
    # end
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
      @board.last_move = input
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
