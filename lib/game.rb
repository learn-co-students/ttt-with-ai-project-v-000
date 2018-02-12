class Game
include Players

attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def board
  @board
end

WIN_COMBINATIONS = [
 [0,1,2], # Top row
 [3,4,5],  # Middle row
 [6,7,8],  # Bottom row
 [0,3,6],  # left column
 [1,4,7],  # middle column
 [2,5,8],  # right column
 [0,4,8],  # left diagonal
 [2,4,6]  # right diagonal
 ]

  def current_player
     self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.board.full? || self.won? || self.draw?
  end


  def won?
  WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = self.board.cells[win_index_1]
   position_2 = self.board.cells[win_index_2]
   position_3 = self.board.cells[win_index_3]

     if [position_1, position_2, position_3].all? {|symbol| symbol == "X"}
       return win_combination
     elsif [position_1, position_2, position_3].all? {|symbol| symbol == "O"}
        return win_combination
      end
    end
  false
  end

  def draw?
   if !self.won? && self.board.full?
     true
   else
     false
   end
  end

  def winner
    if won?
      win_combination = won?
      if @board.cells[win_combination[0]] == "X"
        return "X"
      elsif @board.cells[win_combination[0]] == "O"
        return "O"
      end
    end
  end

  def turn
    input = self.current_player.move(input)
    if !self.board.valid_move?(input)
      input = self.current_player.move(input)
    else
      self.board.update(input,self.current_player)
    end
  end

  def play
    while !self.over?
      self.turn
    end
    if self.won?
      if self.winner == "X"
        puts "Congratulations X!"
      elsif self.winner == "O"
        puts "Congratulations O!"
      end
    end
    if self.draw?
      puts "Cat's Game!"
    end
  end

end
