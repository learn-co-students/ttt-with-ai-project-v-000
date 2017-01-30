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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    self.board.full? || won?
  end

  def draw?
    over? && !won?
  end

  def won?
    cells = self.board.cells
    WIN_COMBINATIONS.find do |combo|
      self.board.taken?(combo[0]+1) && cells[combo[0]] == cells[combo[1]] && cells[combo[0]] == cells[combo[2]]
    end
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    puts "Please select a number 1-9 to make your turn."
    input = gets.chomp
    if self.board.valid_move?(input)
      self.board.update(index, current_player)
    end
  end

end
