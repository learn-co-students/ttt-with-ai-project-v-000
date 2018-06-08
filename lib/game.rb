class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|position| @board.cells[position] == "X"}
        return win
      elsif win.all? {|position| @board.cells[position] == "O"}
        return win
      end
    end
    return false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      win = won?
      board.cells[win[0]]
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "How many players?"
    players = gets.strip
      # if players == 0
      #   Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new)
      #   play
    if players == "1"
      game = self.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new)
      game.play
    elsif players == "2"
      game = self.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new)
      game.play
    else
      puts "Please enter 1 or 2."
      start
    end
  end

end
