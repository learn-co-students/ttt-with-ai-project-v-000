class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      first_token = combination[0]
      second_token = combination[1]
      third_token = combination[2]
      tokens = self.board.cells
      
      if tokens[first_token] == "X" && tokens[second_token] == "X" &&\
         tokens[third_token] == "X"
        @win_holder = "X"
        return true
      elsif tokens[first_token] == "O" && tokens[second_token] == "O" &&\
            tokens[third_token] == "O"
        @win_holder = "O"
        return true
      end
    end
    false
  end

  def draw?
    self.board.full? && won? == false
  end

  def winner
    @win_holder if won?
  end

  def turn
    self.board.display
    input = current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
   if winner
     self.board.display
     puts "Congratulations #{winner}!"
   elsif draw?
     self.board.display
     puts "Cat's Game!"
   end
  end

  WIN_COMBINATIONS = [
    # HORIZONTAL
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    # VERTICAL
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    # DIAGONAL
    [0, 4, 8],
    [2, 4, 6]
  ]
end
