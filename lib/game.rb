class Game
  attr_accessor :board, :player_1, :player_2, :winner

    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]]
  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board || Board.new()
    @player_1 = player_1 || Player::Human.new("X")
    @player_2 = player_2 || Player::Human.new("O")
    @winner = nil
  end

  def current_player
    return @board.turn_count%2 == 0 ? @player_1 : @player_2
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |triplet|
      if triplet.all?{|s| @board.cells[s]=="O"}
        @winner = "O"
        return true
      elsif triplet.all?{|s| @board.cells[s]=="X"}
        @winner = "X"
        return true
      end
    end
    return false
  end

  def winner
    self.won?
    return @winner
  end

  def draw?
    if !self.won? && @board.full?
      return true
    end
    return false
  end

  def turn
    puts "Please enter 1-9:"
    #answer = gets.strip
    if @board.valid_move?(answer)
      @board.update(answer, @board.current_player)
      @board.display
    else
      turn
    end
  end

  def play
  end

end
