class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
       @player_1
    else
       @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[0]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |combination|
      index_1 = combination[0]
      index_2 = combination[1]
      index_3 = combination[2]
      if @board.cells[index_1] ==  "X" && @board.cells[index_2] == "X" && @board.cells[index_3] == "X"
        return "X"
      elsif @board.cells[index_1] == "O" && @board.cells[index_2] == "O" && @board.cells[index_3] == "O"
        return "O"
      end
    end
    nil
  end

  def turn
    user = current_player
    index = user.move(@board)
    if @board.valid_move?(index)
      @board.update(index, user)
      @board.display
    else
      turn
    end
  end


   def play
     until over?
       turn
     end
     if won? && winner == "X"
       puts "Congratulations X!"
     elsif won? && winner == "O"
       puts "Congratulations O!"
     elsif draw?
       puts "Cat's Game!"
     end
   end
end
