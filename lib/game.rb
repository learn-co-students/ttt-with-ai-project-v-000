require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6],
    [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    moves_made = @board.cells.count("X") + @board.cells.count("O")
    moves_made.even? ? @player_1 : @player_2
  end

  def over?
    board.full? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      one = combo[0]
      two = combo[1]
      three = combo[2]
      board = @board.cells
      x = "X"
      o = "O"

      if board[one] == x && board[two] == x && board[three] == x
        return combo
      elsif board[one] == o && board[two] == o && board[three] == o
        return combo
      end
    end

    false
  end

  def draw?
    @board.full? && won? == false
  end

  def winner
    if won?
      save_index = won?
      return board.cells[save_index[0]]
    end
    nil
  end

  def turn
    puts ""
    puts "Player #{current_player.token} make a move by choosing a number 1-9"
    board.display
    puts ""

    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "Please enter a valid move => Player #{current_player.token}"
      turn
    end

  end

  def play

    until over?
      turn
      if won? || draw?
        break
      end
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
