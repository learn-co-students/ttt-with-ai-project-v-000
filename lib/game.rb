require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
    [0, 1, 2], #top-row
    [3, 4, 5], #mid-row
    [6, 7, 8], #bottom-row
    [0, 3, 6], #left-col
    [1, 4, 7], #mid-col
    [2, 5, 8], #right-col
    [0, 4, 8], #top-left to btm-right
    [2, 4, 6]  #top-right to btm-left
  ]

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def over?
    won? || draw?
  end
#make better and maybe move to board
  def turn_count
    counter = 0

    board.cells.each do |char|
      if char == "X" || char == "O"
      counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? player_1 : player_2
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    puts "Player #{current_player.token}, please enter a number 1-9:"

    input = current_player.move(board)

    if !board.valid_move?(input)
      puts "That is not a valid move, try again."
      board.display
      turn
    else
      board.update(input, current_player)
      board.display
    end

  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combination
      else
        false
      end
    end
  end

  def draw?
    !won? && board.full?
  end

end
