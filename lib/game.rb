class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(first_player = Players::Human.new("X"), second_player = Players::Human.new("O"), game_board = Board.new)
    self.board = game_board
    self.player_1 = first_player
    self.player_2 = second_player
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def current_player
    # GitHub has just one line...does it make a difference if I
    # use <<even?>> as opposed to <<% 2 == 0?>>?
    # @board.turn_count % 2 == 0 ? @player_1 : @player_2
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
      self.board.cells[combo[0]] != " "
    end
  end

  def winner
    def token_algorithm
      WIN_COMBINATIONS.detect do |combo|
        self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
        self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
        self.board.cells[combo[0]] != " "
      end
    end

    if won?
      self.board.cells[token_algorithm[0]]
    else
      nil
    end
  end

#  def draw?
#    if won?
#      !(won?)
#    else
#      !(@board.cells.include?(" "))
#    end
#  end

#  This way uses the <<full?>> method which is
# good for labeling the wiring diagram
  def draw?
    @board.full? && !won?
  end

  def turn
    #player = current_player #=> you don't need to use this like on GitHub

    # This line works fine in the 2 player mode
    # because the parameter input isn't really needed
    # for two player mode

    # current_move = current_player.move("user_input")

    # the <@board) is only used when the computer is playing.
    # the (@board) directly below has nothing to do with the
    # other @board's called below.
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.display
      @board.update(current_move, current_player)
      puts "#{current_player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end





#  def play
  # current_player.token           => "X"
  # current_player.move(gets)      => "1"
#    def one_move
#      @board.cells[current_player.move(gets).to_i - 1] = current_player.token
#    end
  #    if draw?
  #      puts "Cat's Game!"
  #    elsif won?
  #      puts "Congratulations #{winner}!"
  #    elsif over?
  #      puts "Who cares!?"
#  end
end
