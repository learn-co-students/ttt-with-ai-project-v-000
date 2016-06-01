class Game

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

  attr_accessor :board, :player_1, :player_2, :result

  def initialize(player_1=nil, player_2=nil, board=nil)
    if player_1 != nil then self.player_1 = player_1 else self.player_1 = Player::Human.new("X") end
    if player_2 != nil then self.player_2 = player_2 else self.player_2 = Player::Human.new("O") end
    if board != nil then self.board = board else self.board = Board.new end
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def non_current_player
    board.turn_count.even? ? player_2 : player_1
  end

  def winning_combi?
    WIN_COMBINATIONS.any? do |combinations|
      self.result = combinations.collect {|position| board.cells[position]}
      self.result == ["X", "X", "X"] || self.result == ["O", "O", "O"]
    end
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
    winning_combi? ? true : false
  end

  def draw?
    board.full? && !won? ? true : false
  end

  def winner
    won? ? result[0] : nil
  end

  def turn
    position = current_player.move(board)
    board.valid_move?(position) ? board.update(position, current_player) : turn
    board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cats Game!"
    end
  end

end
