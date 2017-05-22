
class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 =  player_2
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row win
    [3, 4, 5], #Middle row win
    [6, 7, 8], #Bottom row win
    [0, 3, 6], #left column win
    [1, 4, 7], #middle column win
    [2, 5, 8], #right column win
    [0, 4, 8], #left diagonal win
    [2, 4, 6] #right diagonal win
  ]

  def current_player
    if Board.new.turn_count.even?
      player_1
    end
  end

  def over?
    @board.cells.include?(" ") ? false : true
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|

      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        true
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        true
      else
        false
      end

    end #any?
  end #won

  def draw?
    over? && !won? ? true : false
  end #darw?

  def winner
    if won? && current_player == player_1
      binding.pry
      current_player.token
    elsif won? && current_player == player_2
      player_2.token
    end
  end

end # Class Game
