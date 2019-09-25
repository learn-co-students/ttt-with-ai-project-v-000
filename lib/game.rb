class Game
  attr_accessor :board, :player_1, :player_2
  extend Players

  WIN_COMBINATIONS = [
 [0,1,2],
 [0,3,6],
 [2,4,6],
 [3,4,5],
 [2,5,8],
 [1,4,7],
 [0,4,8],
 [6,7,8]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

   def over?
     won? || draw?
   end

  def won?
    WIN_COMBINATIONS.find do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
      end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won? != nil
      token = self.won?[0]
      winner = @board.cells[token]
    end
    winner
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input) == true
      @board.update(input, current_player)
    else
      turn
    end
    @board.display
  end

  def play
  while over? == false
    turn
    won?
    draw?
  end
  won?
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end
 end

end
