require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :input


  WIN_COMBINATIONS = [[0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #mid column
  [2, 5, 8], #right column
  [0, 4, 8], #diagonal down
  [6, 4, 2]] #diagonal up

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.any? do |combi|
      board.cells[combi[0]] == "X" && board.cells[combi[1]] == "X" && board.cells[combi[2]] == "X" ||
      board.cells[combi[0]] == "O" && board.cells[combi[1]] == "O" && board.cells[combi[2]] == "O"
    end
  end


  def draw?
    !(self.won?) && board.full?
  end

  def winner
    winner = nil
    if self.won?
      WIN_COMBINATIONS.any? do |combi|
        if board.cells[combi[0]] == "X" && board.cells[combi[1]] == "X" && board.cells[combi[2]] == "X"
          winner = "X"
        elsif board.cells[combi[0]] == "O" && board.cells[combi[1]] == "O" && board.cells[combi[2]] == "O"
          winner = "O"
        end
      end
    end
    winner
  end


  def turn
    sleep(1)
    input = current_player.move(board).to_i
    # binding.pry
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      self.turn
    end
  end


  def play
    board.display
    until self.over?
      self.turn
    end
    if self.draw?
      puts "Cats Game!"
    elsif self.won?
      puts "Congratulations #{winner}!"
    end
  end

end