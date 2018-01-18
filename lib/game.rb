class Game
  attr_accessor :board, :player_1, :player_2, :mode, :starter

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def win_combos
    WIN_COMBINATIONS
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board.game = self
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def opponent
    if board.turn_count.even?
      @player_2
    else
      @player_1
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? { |combo| combo.all? {|e| board.cells[e] == "X" } || combo.all? {|e| board.cells[e] == "O"} }
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if self.won?
      WIN_COMBINATIONS.detect do |combo|
        if combo.all? {|e| board.cells[e] == "X" }
          return "X"
        elsif combo.all? {|e| board.cells[e] == "O" }
          return "O"
        end
      end
    end
  end

  def turn
    puts "\nTurn #{@board.turn_count+1}. Player #{self.current_player.token} please enter 1-9:"
    print ">" if self.current_player.class == Players::Human
    input = current_player.move(@board)
    if @board.valid_move?(input)
      self.board.update(input, self.current_player)
      # sleep(0.5)
      board.display
    else
      puts "Invalid move."
      turn
    end
  end

  def play
    turn until self.over?

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "\nCat's Game!\n "
    end
  end

end
