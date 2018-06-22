class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn
    puts "Enter an empty position (1-9)"
    input = gets
    while !@board.valid_move?(input)
      puts "Enter a empty position (1-9)"
      input = gets
    end
    input
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
    winner = WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]]
        #winner = "#{combo[0]}, #{combo[1]}, #{combo[2]}"
      end
    winner
  end

  def draw?
    !self.won? && @board.full?
  end

  def over?
    self.draw? || self.won? || @board.full?
  end

  def winner
    if @board.cells[self.won?[0]] == " "
      return nil
    else
      return @board.cells[self.won?[0]]
    end
  end

end
