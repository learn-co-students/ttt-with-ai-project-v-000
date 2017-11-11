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
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def input_to_index(user_input)
    user_input.strip.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = $stdin.gets.chomp
    if @board.valid_move?(input)
      update(input, self.current_player)
      @board.display
    else
      turn
    end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
      WIN_COMBINATIONS.each do |winning_combo|
        if @board.cells[winning_combo[0]] == @board.cells[winning_combo[1]] &&
           @board.cells[winning_combo[1]] == @board.cells[winning_combo[2]] &&
           @board.taken?(winning_combo[0])
           return winning_combo
        end
      end
    false
  end

  def winner
    won? ? @board.cells[won?[0]].to_s : nil
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw? || @board.full?
  end

  def play
    until over? || turn_count == 10
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
