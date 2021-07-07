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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |wincombo|
      windex_1 = wincombo[0]
      windex_2 = wincombo[1]
      windex_3 = wincombo[2]

      pos_1 = self.board.cells[windex_1]
      pos_2 = self.board.cells[windex_2]
      pos_3 = self.board.cells[windex_3]

      if pos_1 == pos_2 && pos_2 == pos_3 && pos_3 != " "
        return wincombo
      end
    end
    false
  end

  def draw?
    self.won? == false && self.board.full? == true ? true : false
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      wincombo = self.won?
      self.board.cells[wincombo[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
    else
      input = self.current_player.move(self.board)
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end




end
