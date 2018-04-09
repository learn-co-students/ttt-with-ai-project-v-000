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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    binding.pry
  end

  def current_player
    current_player = nil
    if board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
      board.cells[win_combination[0]] == board.cells[win_combination[2]] &&
      board.cells[win_combination[0]] != " "
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    board.display
    input = current_player.move(board)
    if board.valid_move?(input.to_i)
      board.update(input.to_i, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

    puts "Would you like to play again? y/n"
    input = gets.strip
    if input == "y"
      puts "Please enter the number of human players below, from 0 - 2."
      game_logic
    else
      puts "Goodbye!"
    end
  end

end
