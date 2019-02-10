class Game
  attr_accessor :board, :player_1, :player_2, :result

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  #Game completion methods

  def won?

    res = false

    WIN_COMBINATIONS.each do |comb|

      # pass tests for "X" and "O" to #all?
      if comb.all? {|space| self.board.cells[space] == "X"} || comb.all? {|space| self.board.cells[space] == "O"}
        res = comb
      end
    end
    res
  end


  def draw?
    if !won? && self.board.full?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    elsif draw?
      nil
    else
      nil
    end
  end

  #Game turn methods

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def turn
    move_pos = current_player.move(self.board)
    if !self.board.valid_move?(move_pos)
      puts "That move doesn't work. Do better."
      self.turn
    else
      puts "#{current_player.token} plays at #{move_pos}"
      self.board.update(move_pos, self.current_player)
      self.board.display
    end
  end

  def play
    self.board.display
    self.turn until self.over? || self.won? || self.draw?
    if self.won?
      puts "Congratulations #{self.winner}!"
      @result = "#{self.winner}"
    else
      puts "Cat's Game!"
      @result = "d"
    end

  end

end
