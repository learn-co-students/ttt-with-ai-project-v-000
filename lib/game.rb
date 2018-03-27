class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8],
                      [3,4,5], [6,4,2], [6,7,8],
                      [2,5,8], [1,4,7]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || won?
  end

  def won?
    WIN_COMBINATIONS.find do |wincombo|
      # binding.pry
      board.cells[wincombo[0]] == board.cells[wincombo[1]] && board.cells[wincombo[1]] == board.cells[wincombo[2]]
    end
  end

  def draw?
    over? && !won?
  end

##NOT WORKING
  def winner
    won? ? board.cells[won?[0]] : nil
  end
end
