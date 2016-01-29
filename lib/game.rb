class Game 

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal right
  [6,4,2]] #diagonal left

  def current_player
     if board.turn_count.even? 
      @player_1
    else
      @player_2
    end
  end
  
  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |possibility|
      (board.cells[possibility[0]] == board.cells[possibility[1]] && 
      board.cells[possibility[1]] == board.cells[possibility[2]]) && 
      board.cells[possibility[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      return "X" if combo.all? {|position| board.cells[position] == 'X'}
      return "O" if combo.all? {|position| board.cells[position] == 'O'}
    end
    return nil
  end

  def turn
    play = current_player.move(board)
    if board.valid_move?(play)
      board.update(play, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
      board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end

end