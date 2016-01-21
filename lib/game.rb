require_relative "./board.rb"
require_relative "./player.rb"
require_relative "players/human.rb"
require_relative "players/computer.rb"

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
    [2,4,6]
  ]

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    current_player = @player_1
    if board.turn_count%2!=0
      current_player = @player_2
    end
    return current_player
  end

  def won?
     WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
          position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
          position_3 = board.cells[win_index_3] # load the value of the board at win_index_3

          if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end
      end
      return false
  end

  def winner
    x_count = 0
    o_count = 0
    if won?
      board.cells.each do |cell|
        if cell=="X"
          x_count += 1
        end
        if cell=="O"
          o_count += 1
        end
      end
      if x_count > o_count
        return "X"
      end
      if o_count > x_count
        return "O"
      end
    end
  end

  def full?
    if board.full?
      return true
    else
      return false
    end
  end

  def draw?
    if (!won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
    board.display
  end

  # Define your play method below
  def play
    while !over? do
      turn
    end
    if draw?
      puts "Cats Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end


end
