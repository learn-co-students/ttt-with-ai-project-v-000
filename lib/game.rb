
class Game
  attr_accessor :board, :player_1, :player_2
  include Players

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #third column
    [0,4,8], #1 diagonal
    [2,4,6] #2nd diagonal
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      winning_token = ""
      won = true
      combo.each_with_index do |position, index|
        if index == 0
          winning_token = @board.cells[position]
        elsif @board.cells[position] != winning_token
            won = false
        end
      end
      if won == true
        return true
      end
    end
    return false
  end

  def winner

  end

  def start

  end

  def play

  end

  def turn

  end

  def over?
    if @board.turn_count == 9
      return true
    end
    return false
  end

end
