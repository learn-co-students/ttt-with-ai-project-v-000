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
    [2,4,6],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
   # binding.pry
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end


  def over?
   self.draw? || self.won?
  end

  def won?
  WIN_COMBINATIONS.detect do | win_combination |
      win_combination.all? { | win_index | board.cells[win_index] == "X" } || win_combination.all? { | win_index | board.cells[win_index] == "O" }
  end
end

  def draw?
    self.board.turn_count == 9 && !self.won?
  end

  def winner
    win_combination = won?
    if win_combination
      win_index = win_combination[0]
    board.cells[win_index]
  end
end

  def turn
   player = self.current_player
   puts "enter a number 1 - 9"
    turn = player.move(@board)
   if @board.valid_move?(turn) == false
     while @board.valid_move?(turn) == false
     puts "try again"
     turn = player.move(@board)
     end
   end
   @board.update(turn, player)
   @board.display
  end

  def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
