class Game

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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"),
                 player_2=Players::Human.new("O"),
                 board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    cells = self.board.cells
    WIN_COMBINATIONS.each do |combo|
      if self.board.taken?((combo[0] + 1).to_s) &&\
         cells[combo[0]] == cells[combo[1]] &&\
         cells[combo[0]] == cells[combo[2]]
        return combo
      end
    end
    nil
  end

  def over?
    self.won? || self.draw?
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    self.won? && self.board.cells[self.won?[0]]
  end

  def turn
    system("clear")
    puts "\n"
    self.board.display
    pos = nil
    loop do
      puts "\nPlayer #{current_player.token}, please enter a position (1 - 9):"
      pos = self.current_player.move(self.board)
      break if self.board.valid_move?(pos)
    end
    self.board.update(pos, self.current_player)
  end

  def play
    system("clear")
    self.turn until self.over?
    system("clear")
    puts "\n"
    self.board.display
    puts "\n"
    puts self.draw? ? "Cats Game!" : "Congratulations #{self.winner}!"
  end
end
