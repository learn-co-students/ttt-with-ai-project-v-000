class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5,], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

 def current_player
   @board.turn_count.even? ? @player_1 : @player_2
 end

 def over?
   self.draw? || self.won?
 end

 def won?
   WIN_COMBINATIONS.find do |combo|
     combo.all? {|i| self.board.cells[i] == "X"} || combo.all? {|i| self.board.cells[i] == "O"}
   end
 end

 def draw?
   @board.full? && !won?
 end

 def winner
   if combo = won?
     self.board.cells[combo[0]]
   end
 end

 def turn
   #it 'makes valid moves'
   #it 'asks for input again after a failed validation'
   #it 'changes to player 2 after the first turn'
   puts "It's #{current_player.token}'s turn"
   sleep(1.5)
   current_move = current_player.move(board)
   if board.valid_move?(current_move)
     board.update(current_move, current_player)
     board.display
   else
     turn
   end
 end

 def play
   turn until over?
   puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end
end
