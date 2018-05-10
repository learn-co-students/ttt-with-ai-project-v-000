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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo[0]]
    end
  end

  def turn
    @board.display
    puts "Please enter 1-9, player #{self.current_player.token}"
    input = self.current_player.move(self.board)
      if self.board.valid_move?(input)
        self.board.update(input, self.current_player)
      else
        puts 'Invalid Input or spot taken! Enter again!'
        self.turn
      end
  end

  def play
    until self.over?
      self.turn
    end
    self.board.display
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end






end
