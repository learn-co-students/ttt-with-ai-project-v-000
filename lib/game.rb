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
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
    #binding.pry
  end

  def won?
    #binding.pry
    WIN_COMBINATIONS.detect do |combo|
      @board.position(combo[0]+1) == @board.position(combo[1]+1) &&
      @board.position(combo[1]+1) == @board.position(combo[2]+1) &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    !self.won? && @board.cells.all?{|token| token == "X" || token == "O"}
  end

  def full?
    @board.cells.all?{|token| token == "X" || token == "O"}
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if winning_combo = won?
      @winner = @board.position(winning_combo.first+1)
    end
  end

  def play
   while !self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def turn
    cur_player = current_player
    current_move = cur_player.move(@board)
    if !@board.valid_move?(current_move)
      self.turn
    end
    @board.display
    puts "Turn Count = #{@board.turn_count+1}"
    @board.update(current_move, cur_player)
    puts "#{cur_player.token} now moved to #{current_move}"
    @board.display
  end
end
