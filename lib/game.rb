class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all?{|position| board.cells[position] == 'X'}
      return combo if combo.all?{|position| board.cells[position] == 'O'}
    end
    false
  end

  def draw?
    !won? && board.full?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      board.display
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
    board.display
  end

  def start
    puts '------------------'
    puts 'Get ready!'

    play

    puts ''
    puts 'Would you like to play again? YES or NO'
    new_game = gets.strip.downcase

    case new_game
    when 'yes'
      player_start
    when 'no'
      puts '---------------'
      puts 'Thank you for playing!'
    else
      puts 'Try again!'
    end
  end

  def player_start
    puts 'Welcome to Tic-Tac-Toe'
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
