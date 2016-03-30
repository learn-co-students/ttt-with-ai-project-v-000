class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #Top Horizontal
    [3,4,5], #Mid Horizontal
    [6,7,8], #Bot Horizontal
    [0,3,6], #Left Vertical
    [1,4,7], #Mid Vertical
    [2,5,8], #Right Vertical
    [0,4,8], #Top Left -> Bottom Right
    [2,4,6]  #Top Right -> Bottom Left
  ]

  @@wins = []

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" ||
      board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
    end
  end

  def draw?
    self.won? == false && self.board.full? == true
  end

  def winner
    winner = nil
    if self.won?
      WIN_COMBINATIONS.any? do |combo|
        if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
          winner = "X"
        elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
          winner = "O"
        end
      end
    end
    winner
  end

  def turn
    sleep(1)
    move = current_player.move(board).to_i
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      self.turn
    end
  end

  def play
    board.display
    until self.over?
      self.turn
    end
    if self.draw?
      puts "Cats Game!"
    elsif self.won?
      puts "Congratulations #{winner}!"
    end
  end
      
end
