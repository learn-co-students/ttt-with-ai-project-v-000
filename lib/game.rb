class Game
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [6, 4, 2],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board    = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    won = nil

    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |cell| board.cells[cell] == 'X' } || combo.all? { |cell| board.cells[cell] == 'O' }
        won = combo
        return won
      end
    end

    won
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?.first] if won?
  end

  def turn
    puts "#{current_player.token}, please enter 1-9"
    input = current_player.move(board)
    unless board.valid_move?(input)
      board.display
      return turn
    end
    board.update(input, current_player)
    board.display
  end

  def play
    board.display
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
    # sleep(1)
   #TODO uncomment this method after all requirements are implemented -> play_again?
  end

  def play_again?
    puts 'Play again? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      rematch?
    when 'n'
      nil
    else
      play_again?
    end
  end

  def rematch?
    puts 'Rematch? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      board.reset!
      play
    when 'n'
      TicTacToe.initialize_game.play
    else
      rematch?
    end
  end
end