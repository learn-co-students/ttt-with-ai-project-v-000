class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? && player_1.token == "X" ? player_2 : player_1
  end

  def over?
    self.draw? || self.won? ? true : false
    # true = draw or won
    # false = in progress (not full or no winner)
  end

  def draw?
    # if board.full? && !won? => true
    board.full? && !self.won? ? true : false
  end

  def won?
    # if the cells in any of the combos are all the same symbol
    # there should be a better way to do this
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
        return combo
      elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
        return combo
      end
    end
    return false
  end

  def winner
    if !self.won?
      nil
    else
      self.won?.all?{|item| board.cells[item] == "X"} ? winner = "X" : winner = "O"
    end
  end

  def turn
    puts "where would you like to move? (1-9)"
    move = self.current_player.move(current_player.token)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
    else
      puts "invalid"
      puts "where would you like to move? (1-9)"
      move = self.current_player.move(current_player.token)
    end
  end

  def play
    while !self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end
end
