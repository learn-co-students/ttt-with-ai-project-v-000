class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5],
[6, 7, 8], [0, 4, 8],
[2, 4, 6], [0, 3, 6],
[1, 4, 7], [2, 5, 8],
]

def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
return @player_1 if board.turn_count.even?
else
  @player_2
end

def won?
  WIN_COMBINATIONS.detect { |win_combination|
          @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
          @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
          @board.taken?(win_combination[0]+1)}
  end

  def draw?
  @board.full? && !won?
  end

  def over?
    @board.full? || won? || draw?
  end

  def winner
    if WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "X"}}
            "X"
    elsif WIN_COMBINATIONS.any? {|array| array.all? {|cell| self.board.cells[cell] == "O"}}
            "O"
    else
          nil
      end
  end

  def turn
        user_input = self.current_player.move(self.board)
        if !self.board.valid_move?(user_input)
            self.current_player.move(self.board)
        else
            self.board.update(user_input, self.current_player)
        end
        user_input
    end

    def play
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

end
