# game.rb
#
# The Game class is the main model of the application and represents a singular instance of a Tic-tac-toe session
#


class Game

  attr_accessor :board, :player_1, :player_2


  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #right col
    [1, 4, 7], #middle col
    [2, 5, 8], #left col
    [0, 4, 8], #first diag
    [2, 4, 6] #last diag
  ]

  def initialize(player_1 = nil, player_2 = nil, board = Board.new) 
    if !player_1
      @player_1 = Players::Human.new("X")
    else
      @player_1 = player_1
    end
    if !player_2
      @player_2 = Players::Human.new("O")
    else
      @player_2 = player_2
    end
    @board = board

  end

  def board
    @board
  end

  def current_player
    which = @board.cells.count {|item| item == " "}
    if !which.even? 
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end 
    false
  end

  def full?
    @board.cells.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    if !self.won? && self.full?
      true
    elsif !self.won? && !self.full?
      false
    else
      false
    end
  end

  def over?
    if self.won? || self.draw? || self.full?
      true
    else
      false
    end
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    index = current_player.move(board) 
    if board.valid_move?(index)
      board.update(index, current_player)
      board.display
    else
      turn
    end
  end

  def play
    self.turn until self.over?
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end 





end


