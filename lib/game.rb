class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ #all possible win combinations
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won? #checks win combinations and displays winning combo
    WIN_COMBINATIONS.each do |combination|
      win_position_1 = combination[0]
      win_position_2 = combination[1]
      win_position_3 = combination[2]

      position_1 = self.board.cells[win_position_1]
      position_2 = self.board.cells[win_position_2]
      position_3 = self.board.cells[win_position_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combination
      end
    end
    return false
  end

  def over? #stops game if any of the conditions are true
    if self.board.full? || self.won? || self.draw?
      return true
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if self.won?
     self.board.cells[self.won?[0]]
   end
 end

  def turn
    if board.turn_count == 0
      puts "Player #{current_player.token}, please enter 1-9:"
      self.board.display
    end
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
    else
      puts "That move was invalid"
      self.turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
