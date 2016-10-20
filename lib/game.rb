class Game
  attr_accessor :player_1, :player_2, :board
  extend Players

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

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

  def turn
    loop do
      input = input_to_index(current_player.move(@board))
      if @board.valid_move?(input + 1) == true
        @board.cells[input] = current_player.token
        @board.display
        break
      end
    end
  end

  def won?
      WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        else
          false
        end
      end

      if @board.cells.include?("X" || "O") == false
        false
      end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    x_count = @board.cells.select{|i| i == "X"}
    o_count = @board.cells.select{|i| i == "O"}
    if x_count.length > o_count.length
      "X"
    elsif o_count.length > x_count.length
      "O"
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end

  end
end
