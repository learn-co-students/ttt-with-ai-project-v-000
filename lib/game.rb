class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    # if @board.turn_count % 2 == 0
    #   @player_1
    # else
    #   @player_2
    # end
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    # binding.pry
    WIN_COMBINATIONS.find do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]]
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won? == "X"
      "X"
    elsif won? == "O"
      "O"
    else
      nil
    end       
  end


end
