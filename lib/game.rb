class Game
  attr_accessor :board, :player_1, :player_2, :winner
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  @board = []

  def board
    @board
  end

  def initialize(one = Player::Human.new("X"), two = Player::Human.new("O"), board = Board.new) 
    @player_1 = one
    @player_2 = two
    @board = board
    @winner = []
  end

  def current_player
    if self.board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def over?
    true if won? || draw?
  end

  def won?
     WIN_COMBINATIONS.detect do |combinations|
       if combinations.all? {|position| board.cells[position] == "X"}
        @winner = "X"
        return combinations
       elsif combinations.all? {|position| board.cells[position] == "O"}
        @winner = "O"
        return combinations
       else
        @winner = nil
        false
       end
    end
  end

  def draw?
    true if ! self.won? && self.board.full?
  end

  def winner
    self.won?
    @winner
  end

  def turn
    input = current_player.move(board).to_i
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      self.turn
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    else self.draw?
      puts "Cats Game!"
    end
  end
end


  

  