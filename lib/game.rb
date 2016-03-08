class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # diagonal from top left
    [6,4,2]  # diagonal from top right
  ]

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    @board.count{|space| space == "O" || space == "X"}
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
       board.taken?(combination[0]+1) && board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[2]] == board.cells[combination[1]]
     end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def full?
    @board.cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "invalid"
      @board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
