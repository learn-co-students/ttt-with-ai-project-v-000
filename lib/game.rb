class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
           win_combination.all? do |win_combination_index|
        board.cells[win_combination_index] == "X" ||
               win_combination.all? do |win_combination_index|
           board.cells[win_combination_index] == "O"
        end
      end
    end
  end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end

  def winner
    if WIN_COMBINATIONS.detect do |win_combination|
        win_combination.all? do |win_combination_index|
          board.cells[win_combination_index] == "X"
        end
        end
      "X"
    elsif WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? do |win_combination_index|
          board.cells[win_combination_index] == "O"
        end
        end
      "O"
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    elsif input == "quit"
      exit
    else
      puts "Oops, Try Another Space"
      turn
    end
  end

  def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
     "won"
   elsif draw?
     puts "Cat's Game!"
   end
  end





end
