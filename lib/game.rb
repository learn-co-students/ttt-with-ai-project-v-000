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
    if @board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"} || WIN_COMBINATIONS.detect {|combo| self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"}
  end

  def draw?
    board.full? && !won?
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
    puts "Where would you like to go?"
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
    until over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    else
      puts "something is wrong"
    end

  end

end
