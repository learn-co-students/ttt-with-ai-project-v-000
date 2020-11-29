class Game
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    x = @board.cells.count {|x| x == "X" || x == "O"}
    if x.even?
      @player_1
    elsif x.odd?
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def draw?
    true if won? == false && @board.full? == true
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    if won? == false
      nil
    elsif @board.cells[won?[0]] == "X"
      "X"
    elsif @board.cells[won?[0]] == "O"
      "O"
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = current_player.move(board).to_i
    if @board.valid_move?(index)
      @board.update(index, current_player)
      @board.display
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    if over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
    else
      turn
      play
    end
  end

end
