class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #down diagonal
    [6, 4, 2]  #up diagonal
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1 == nil && player_2 == nil && board == nil
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    else
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
    #binding.pry
  end

  def won?
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board.cells[combo[0]]
      position_2 = @board.cells[combo[1]]
      position_3 = @board.cells[combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winning_combo = combo
        break
      elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        winning_combo = combo
        break
      end
    end
    winning_combo
  end

  def draw?
    if @board.full? && self.won? == nil
      true
    end
  end

  def over?
    (self.won? || self.draw?) ? true : false
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
    #won_index = self.won?[0]
    #self.board.cells[won_index]
  end

  def turn
    position = self.current_player.move
    @board.update(position, self.current_player)
  end


end
