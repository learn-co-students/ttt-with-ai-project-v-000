class Game
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left columns
    [1, 4, 7], #middle columns
    [2, 5, 8], #right columns
    [0, 4, 8], #diagonal 1
    [2, 4, 6] #diagonal 2
  ]

  attr_accessor :board, :player_1, :player_2, :current_player


  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    if self.board.cells.all? {|position| board.taken?(position)}
      return true
    end
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"} || WIN_COMBINATIONS.detect {|combo| self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"}
  end

  def draw?
    self.over? && !self.won?
  end

  def winner
    if WIN_COMBINATIONS.any? {|combo| self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"}
      return "X"
    elsif WIN_COMBINATIONS.detect {|combo| self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"}
      return "O"
    else
      nil
    end
  end

  def turn
    play = self.current_player.move(self.board)
    if self.board.valid_move?(play)
      self.board.update(play, self.current_player)
      self.board.display
    else
      loop do
        puts "Try again. Enter empty space number 1-9."
        play = self.current_player.move(self.board)
        if self.board.valid_move?(play)
          self.board.update(play, self.current_player)
          self.board.display
          break
        end
      end
    end
  end

  def play
    # self.turn
    until self.won? || self.draw?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
