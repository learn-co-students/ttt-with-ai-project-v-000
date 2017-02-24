class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
\
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw? || full?
  end

  def won?
    WIN_COMBINATIONS.each do |i|
      combo_1 = @board.cells[i[0]]
      combo_2 = @board.cells[i[1]]
      combo_3 = @board.cells[i[2]]

        if combo_1 == "X" && combo_2 == "X" && combo_3 == "X"
          return true
        elsif combo_1 == "O" && combo_2 == "O" && combo_3 == "O"
          return true
        end
      end
    return false
  end

  def full?
    !@board.cells[0..8].any? {|move| move == "" || move == " "}
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win|
      if win.all? {|i| @board.cells[i] == "X" }
        return "X"
      elsif win.all? {|i| @board.cells[i] == "O"}
        return "O"
      end
    end
    return nil
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
    @board.display
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
