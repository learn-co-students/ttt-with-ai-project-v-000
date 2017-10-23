class Game
include Players
attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = nil, player_2=nil, board=nil)
    self.player_1 = (!player_1) ? Human.new("X") : player_1
    self.player_2 = (!player_1) ? Human.new("O") : player_2
    self.board = (!board) ? Board.new : board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    !won? ? true : false
  end

  def winner
    if(won?)
      self.board.cells[won?[0]]
    end
  end

  def turn
    #binding.pry
    input = self.current_player.move(board)
    while(!self.board.valid_move?(input))
      input = self.current_player.move(board)
    end
    self.board.update(input, self.current_player)
  end



end
