require "pry"

class Game
  attr_accessor :board
  attr_reader :player_1, :player_2

  WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    play
  end
  #binding.pry

### GAME MECHANICS ###
  def play
    while !over?
      turn
    end
    if won? != false
      board.display
      puts "Congratulations #{winner}!"
      play_again
    elsif draw?
      board.display
      puts "Cat's Game!"
      play_again
    end
  end

  def turn
    puts "Player #{current_player.token}:"
    puts "Choose square 1-9 to place your token!"
    board.display
    position = current_player.move(board.cells)
    if  board.valid_move?(position) && position.to_i >= 1 && position.to_i <= 9
      board.update(position, current_player)
    else
      turn
    end
  end

  def current_player
    taken_cells = board.cells.find_all {|cell| cell != " "}
    taken_cells.length.even? ? player_1 : player_2
  end

### GAME END METHODS ###
  def over?
    true if board.full? || won? != false || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    if won? == false && board.full? == true
      true
    elsif won? == false && board.full? == false
      false
    elsif won? != false
      false
    end
  end

  def winner
    if won? == false || draw? == true
      nil
    else
      winning_line = won?
      index = winning_line[0]
      board.cells[index]
    end
  end

  def play_again
    puts "Play again? Y or N"
    input = gets.chomp.downcase
    if input == "y"
      GameController.new
    else
      puts "Thanks for playing!"
    end
  end
end
