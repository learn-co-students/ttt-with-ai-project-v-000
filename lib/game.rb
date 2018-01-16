class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      check = combo.collect {|position| self.board.cells[position]}
      if check.all? {|token| token == player_1.token}
        winner = combo
      elsif check.all? {|token| token == player_2.token}
          winner = combo
      end
    end
  end

  def draw?
    self.board.turn_count == 9 && !self.won? ? true : false
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    player = current_player
    puts "Player #{player.token}, it is your turn."
    move = player.move(self.board)
    if !self.board.valid_move?(move)
      turn
    else
      self.board.update(move, player)
      self.board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

end
