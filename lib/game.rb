class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize(p1=Players::Human.new("X"),p2=Players::Human.new("O"),
      board=Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    #check if X has won
    out = WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? do |index|
        self.board.cells[index] == "X"
      end
    end

    if out
      return "X"
    end

    #if X hasnt won check for O winning
    out = WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? do |index|
        self.board.cells[index] == "O"
      end
    end

    if out
      return "O"
    else
      return nil
    end
  end

  def won?
    self.winner ? true : false
  end

  def draw?
    self.board.full? && !self.won?
  end

  def turn
    prompting = true
    while prompting
      input = self.current_player.move(self.board)

      if self.board.valid_move?(input)
        return self.board.update(input,self.current_player)
      else
        puts "Enter valid move."
      end
    end
  end

  def play
    while !self.over?
      self.turn
    end

    self.board.display

    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end

end
