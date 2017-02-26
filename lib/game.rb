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


  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    won? || draw?
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

  def turn
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
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end