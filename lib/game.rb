class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      player_1
    else player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find { |win_combination| board.cells[win_combination[0]] == board.cells[win_combination[1]] &&  board.cells[win_combination[1]] == board.cells[win_combination[2]] && board.cells[win_combination[0]] != " "}
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    puts "Where would you like to go?"
    board.display
    index = current_player.move(board)
    if board.valid_move?(index)
      board.update(index, current_player)
      board.display
    else puts "Invalid move."
      turn
    end
  end

  def play

    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
       puts "Cat's Game!"
    end
  end

end
