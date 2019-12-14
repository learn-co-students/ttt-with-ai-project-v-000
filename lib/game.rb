class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8],
                      [3,4,5], [6,4,2], [6,7,8],
                      [2,5,8], [1,4,7]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.find do |wincombo|
      board.cells[wincombo[0]] == board.cells[wincombo[1]] &&
      board.cells[wincombo[1]] == board.cells[wincombo[2]] &&
      board.cells[wincombo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
    # over? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    input = ""
    while !board.valid_move?(input)
      input = current_player.move(board)
    end
    board.update(input, current_player)
  end

  def play
    while !over?
      board.display
      puts ""
      puts "#{current_player.token}'s turn"
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
