require 'pry'

class Game

	attr_accessor :player_1, :player_2, :board

	WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
	]

	def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
	  @player_1 = player_1
	  @player_2 = player_2
	  @board = board
	end

  def current_player
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    return true if draw? || won?
  end

  def draw?
    return true if board.full? && !won?
  end

  def won?
  
    position_x = board.cells.each_index.select {|cell| board.cells[cell] == "X"}
    position_o = board.cells.each_index.select {|cell| board.cells[cell] == "O"}

    if WIN_COMBINATIONS.any? {|x| (x - position_o).empty?}
      true
    elsif WIN_COMBINATIONS.any? {|x| (x - position_x).empty?}
      true
    else
      false
    end
  end

  def winner

    position_x = board.cells.each_index.select {|cell| board.cells[cell] == "X"}
    position_o = board.cells.each_index.select {|cell| board.cells[cell] == "O"}

    if WIN_COMBINATIONS.any? {|x| (x - position_o).empty?}
      "O"
    elsif WIN_COMBINATIONS.any? {|x| (x - position_x).empty?}
      "X"
    else
      nil
    end
  end

  def turn

    player = self.current_player
    move = player.move(board)
    if board.valid_move?(move)
      board.update(move, player)
    else
      player.move(board)
    end
  
  end

  def play
    
    until over? 
      turn     
    end

    if won?
      puts "Congratulations #{self.winner}!"
    end

    if draw?
      puts "Cats Game!"
    end

  end


end