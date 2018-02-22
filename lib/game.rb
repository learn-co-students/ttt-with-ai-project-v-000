class Game
  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # 1st column
    [1,4,7],  # 2nd column
    [2,5,8],  # 3rd column
    [0,4,8],  # diagonal down
    [2,4,6]   # diagonal up
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count%2 == 0? (self.player_1) : (self.player_2)
  end

  def over?
    draw? || (won?!=false)
  end

  def won?
    match = false
    WIN_COMBINATIONS.each do |c|
      pos = [self.board.cells[c[0]], self.board.cells[c[1]], self.board.cells[c[2]]]
      if (pos[0] == "X" && pos[1] == "X" && pos[2] == "X") || (pos[0] == "O" && pos[1] == "O" && pos[2] == "O")
        match = c
      end
    end
    match
  end

  def draw?
    #binding.pry
    (!self.won? && self.board.full?)
  end

  def winner
    self.board.cells[self.won?[0]] if won?
  end

  def turn
    move = nil
    while !(1..9).to_a.collect {|i| i.to_s}.include?(move)
      move = self.current_player.move(self.board)
    end
    if self.board.cells[move.to_i-1] != " "
      puts "That spot's taken - choose another!"
    end
    self.board.cells[move.to_i-1] = self.current_player.token unless self.board.cells[move.to_i-1] != " "

  end

  def play
    while !over?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
