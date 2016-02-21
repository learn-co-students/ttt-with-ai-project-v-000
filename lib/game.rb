class Game
  attr_accessor :board, :player_1, :player_2, :cells

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # left diag
    [2, 4, 6] # right diag
  ]

  def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
    end

  def over?
    (@board.full? || won? || draw?) ? true : false
    end

  def won?
    WIN_COMBINATIONS.each do |combination|
      next unless @board.get_cells(combination).uniq.length == 1
      token = @board.cells[combination[0]]
      if (token == 'X') || (token == 'O')
        @winner = token
        return true
      end
    end
    false
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    self.won?
    @winner == ' ' ? nil : @winner
  end

  def turn
    loop do
      puts "It's player #{current_player.token}'s move. Enter a number 1-9"
      move = current_player.move(board)
      if @board.valid_move?(move)
        @board.update(move, current_player)
        @board.display
        break
      end
      puts 'Invalid move.  Please try again.'
    end
  end

  def play
    turn until self.over?
    if won?
    puts "Congratulations #{@winner}!"
    elsif draw?
    puts "Cats Game!"
    end
  end
end
