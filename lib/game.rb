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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |i| board.cells[i] == 'X' } || combo.all? { |i| board.cells[i] == 'O' }
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    board.cells[won?[0]] unless won?.nil?
  end

  def turn
    puts ''
    puts "Player #{current_player.token} is next, make your move!"
    puts ''

    cell = current_player.move(board)
    if board.valid_move?(cell)
      board.update(cell, current_player)
    else
      puts 'Invalid turn, Try Again!'
      turn
    end
  end

  def play
    until over?
      turn
      puts ''
      @board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts '------------------'
    puts 'Get ready!!'

    play

    puts ''
    puts 'Would you like to play again? YES or NO'
    new_game = gets.strip.downcase

    case new_game
    when 'yes'
      player_start
    when 'no'
      puts '---------------'
      puts 'Game Over!'
      puts 'Thank you for playing'
    else
      puts 'Try again!'
    end
  end

  def player_start
    puts 'Welcome to Tic-Tac-Toe Game'
    puts ''
    puts 'How many players? 0, 1, 2'
    players = gets.strip


    case players
    when '0'
      player0 = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
      player0.start
    when '1'
      player1 = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
      player1.start
    when '2'
      player2 = Game.new
      player2.start
    else
      puts 'Try Again!'
    end

  end
end
