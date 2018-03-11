class Game

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

 attr_accessor :player_1, :board, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    win = nil
    WIN_COMBINATIONS.each do |combo|
      combos = []
      combo.each do |space|
        combos << board.cells[space]
      if combos == ["X","X","X"] || combos == ["O","O","O"]
        win = combo
      end
    end
  end
    win
  end

  def draw?
    @board.full? && self.won? == nil ? true : false
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    self.won? ? @board.cells[won?[0]] : nil
  end

  def turn
    player = self.current_player
    input = player.send :gets
  until @board.valid_move?(input)
    input = player.send :gets
  end
    @board.update(input, player)
  end

  def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
 end
end
