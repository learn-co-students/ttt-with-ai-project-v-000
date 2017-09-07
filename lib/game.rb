class Game
    extend Players
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  #  = {player_1: Players.Human.new("X"), player_2: Players.Human.new("O"), board: Board.new}

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    self.board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all?{|index|self.board.cells[index] == "X"}
        win_combination
      elsif win_combination.all?{|index|self.board.cells[index] == "O"}
        win_combination
      else
        false
      end
    end
  end

  def winner
    won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    input = current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
    end
  end

end  # End of Class
