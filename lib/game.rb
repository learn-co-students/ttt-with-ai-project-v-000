class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    board.turn_count.odd? == true ? self.player_2 : self.player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if
        win_combination.all? do |win_index|
          self.board.cells[win_index]=="X"
        end
        true
      elsif
        win_combination.all? do |win_index|
          self.board.cells[win_index]=="O"
        end
        true
      else
        false
      end
    end
  end
  
  def draw?
    if self.board.full? == true && self.won? == nil
      true
    else
      false
    end
  end

  def over?
    if self.won? != nil || self.board.full? == true
      true
    else
      false
    end
  end

  def winner
    if self.won? == nil
      nil
    elsif self.won? != nil
      self.board.cells[self.won?.pop]
    end
  end

  def turn
    player = self.current_player
    move = 0
    until self.board.valid_move?(move) == true
      move = player.move(self.board)
    end
    self.board.update(move, player)
    self.board.display
  end 
end