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
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    draw? || won?
  end

  def won?
    combo_found = nil
    combo_found = WIN_COMBINATIONS.find do |combo|
      combo.all?{|space| board.cells[space] == "X"} || combo.all?{|space| board.cells[space] == "O"}
    end
    combo_found
  end


  def draw?
    !won? && board.full?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn  # <= this isn't passing
    input = current_player.move(board).to_i
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      self.turn
    end
  end

  def play
    unless over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
