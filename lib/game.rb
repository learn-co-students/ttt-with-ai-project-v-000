
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    #horizontal wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertial wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal wins
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Human.new(token = "X"), player_2 = Human.new(token = "O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def draw?
    self.board.full? == true && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[1]] == self.board.cells[win[2]] && self.board.taken?(win[0]+1)
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winner = won?
      self.board.cells[winner[0]]
    end
  end

  def turn
    self.current_player.move(board) #intent: call #current_player on game instance. call #move on that player to get input.
    until self.board.valid_move?(self.current_player.move(board)) #intent: call #valid_move on this game instance's board. give #valid the user's input from the line above as the position argument. move into the block if the original input isn't valid.
      self.current_player.move(board) #ask for current player input until it is valid
    end
    self.board.update(self.current_player.move(board), self.current_player) #update board with valid position and current player (should place that player's token in the valid position cell)
  end
end
