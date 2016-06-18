
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
    #self.current_player.move(board) #intention: find current player of game instance. get the player object. call #move method on that player for input
    after = self.board
    current = self.current_player

    if !after.valid_move?(current.move(board)) #intention: call #valid move on current game's board to see if above input was a valid play. IF IT ISN'T (next line)
      until after.valid_move?(current.move(board))
        current.move(board) #ask the current player for input again because the first wasn't valid
      end
    else after.update(current.move(board), current) #if the current player's input was a valid move, call #update method on this game's board to place that player's token in the correct space
      current.move(board) #now that the original current player went and the board has been updated, call current player on current game again (should give the other player instance) and call #move on them just like the previous player.
    end
  end
end
