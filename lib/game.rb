class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [2, 5, 8],
    [1, 4, 7],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

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
    loop do
      input = current_player.move(board)
      if board.valid_move?(input)
        board.update(input, current_player)
        break
      end
    end
  end

  def play
    board.display
    until over?
      turn
      board.display
    end

    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    winner
  end

  def self.start
    puts 'Welcome to Tic Tac Toe!'
    loop do
      puts 'Number of players? [ 0 / 1 / 2 ]'
      n = nil
      n = gets.strip.to_i until [0, 1, 2].include?(n)

      first = nil
      if n == 1
        puts 'Who goes first? [ me / computer ]'
        first = gets.strip until %w[me computer comp].include?(first)
      end

      player_1, player_2 = generate_players(n, first)

      game = Game.new(player_1, player_2)
      w = game.play
      puts 'Play again? [ y / N ]'
      break if ['n', 'no', 'N', 'NO', ''].include?(gets.strip)
    end
  end

  def self.generate_players(n, first)
    one = n == 0 || (n == 1 && first != 'me')
    player_1 = one ? Players::Computer.new('X') : Players::Human.new('X')

    two = n == 0 || (n == 1 && first == 'me')
    player_2 = two ? Players::Computer.new('O') : Players::Human.new('O')

    [player_1, player_2]
  end
end
