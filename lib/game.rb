class Game
attr_accessor :board, :player_1, :player_2
extend Players

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    self.play
  end

  def current_player
    (self.board.turn_count.odd?) ? self.player_2 : self.player_1
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combo|

      if self.board.cells[winning_combo[0]] == "X" && self.board.cells[winning_combo[1]] == "X" && self.board.cells[winning_combo[2]] == "X"
        return  winning_combo

      elsif self.board.cells[winning_combo[0]] == "O" && self.board.cells[winning_combo[1]] == "O" && self.board.cells[winning_combo[2]] == "O"
        return winning_combo
      end
    end

    return false
  end

  def draw?
    if self.won? || self.board.turn_count != 9
      return false
    else
      true
    end
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    self.board.display
    puts "Pleae enter a valid move:"
    input = (current_player.move(board))

    if self.board.valid_move?(input)
      self.board.update(input,current_player)
    else
      self.turn
    end
  end

  def play
    self.turn until self.over?
    self.board.display
    self.won? ? (puts "Congratulations #{self.winner}!") : (puts "Cat's Game!")
  end


end
