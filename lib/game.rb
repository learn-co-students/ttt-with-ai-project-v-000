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

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    @welc
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    if self.board.full? == true || self.won? == true
      response = true
    else
      response = false
    end
    #binding.pry
    return response
  end

  def won?
    winner = WIN_COMBINATIONS.detect{|combination|
      self.board.cells[combination[0]] == self.board.cells[combination[1]] && self.board.cells[combination[1]] == self.board.cells[combination[2]] && self.board.cells[combination[0]] != " "
    }
    !!winner ? winner : false
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    w = won?
    w ? self.board.cells[w[0]] : nil
  end

  def turn
    self.board.display
    #binding.pry
    m = self.current_player.move(self.board)
    m = m.to_i
    until self.board.valid_move?(m) do
      binding.pry
      puts "Invalid board selection."
      m = self.current_player.move(self.board)
    end
    self.board.update(m,self.current_player)
  end

  def play
    #binding.pry
    self.board.display
    self.turn
    if self.over?
      puts "over"
    else
      self.turn
    end

  end

end
