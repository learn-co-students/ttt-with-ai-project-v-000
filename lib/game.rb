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
    if board.turn_count.odd?
      player_2
    else
      player_1
    end
  end

  def won?
    WIN_COMBINATIONS.find do |x|
      x.all? {|y| board.cells[y] == "X"} || x.all? {|y| board.cells[y] == "O"}
    end
  end

  def draw?
    board.full? && !self.won?
  end

  def over?
    if self.draw? || self.won?
      true
    else !board.full?
      false
    end
  end

  def winner
    board.cells[self.won?[0]] if self.won?
  end

  def turn
    puts "Please enter a number (1-9):"
    input = self.current_player.move(board)
      if board.valid_move?(input)
        board.update(input, self.current_player)
      else
        turn
      end
    board.display
  end

  def play
    turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end




end
