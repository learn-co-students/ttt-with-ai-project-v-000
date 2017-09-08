class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end


  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def clone
    Game.new(player_1 = @player_1, player_2 = @player_2, board = self.board.clone)
  end

  def turn
    player_input = current_player.move(self) 
    if board.valid_move?(player_input)
      sleep 0.2
      board.update(player_input, current_player)
      print %x{clear}
      board.display
    else

      turn
    end
  end



  def play
    turn until over?
    puts winner ? ("Congratulations #{winner}!") : "Cat's Game!"
  end

  def start # a blank test spec for this...
  end

end
