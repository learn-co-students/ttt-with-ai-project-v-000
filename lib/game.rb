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
    board.cells.count{|c| c != " "}.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      position_1 = board.cells[combination[0]]
      position_2 = board.cells[combination[1]]
      position_3 = board.cells[combination[2]]
      if position_1 == player_1.token && position_2 == player_1.token && position_3 == player_1.token
        return combination
      elsif position_1 == player_2.token && position_2 == player_2.token && position_3 == player_2.token
        return combination
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won? || board.full?
  end

  def winner
    if !won?
      nil
    elsif board.cells[won?.first] == player_1.token
      return player_1.token
    elsif board.cells[won?.first] == player_2.token
      return player_2.token
    end
  end

  def turn
    puts "\nPlease enter 1 - 9:\n"
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    end
    board.update(input, current_player)
    puts "\n"
    board.display
    puts "\n"
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      puts "\n"
    elsif draw?
      puts "Cat's Game!"
      puts "\n"
    end
  end

end
