class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      a, b, c = combo.map { |i| board.cells[i] }
      return combo if a == b && b == c && %w[X O].include?(a)
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    result = won?
    result ? board.cells[result[0]] : nil
  end

  def turn
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    board.display
    until over?
      turn
      board.display if board.turn_count.even?
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
    winner
  end

  def self.start
    puts 'Welcome to Tic Tac Toe'
    loop do
      player_1 = Players::Computer.new('X')
      player_2 = Players::Computer.new('O')
      game = Game.new(player_1, player_2)
      w = game.play
      # puts 'Play again? [Y/n]'
      # break if %w[n no N NO].include?(gets.strip)
      break if w == 'O'
    end
  end
end
