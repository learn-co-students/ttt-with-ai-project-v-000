class Game
  attr_accessor :board, :player_1, :player_2, :playercount, :first_player
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      return @player_1
    else return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wc|
      ar = [@board.cells[wc[0]], @board.cells[wc[1]], @board.cells[wc[2]]]
      return wc if ar.uniq.length == 1 && ar.include?(" ") != true
    end
    return false
  end

  def draw?
    self.won? == false && @board.full? == true ? true : false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    if self.won?
      win = @board.cells[self.won?[0]]
      if win == "X" || win == "O"
        return win
      else
       return nil
      end
    end
  end

  def turn
    trn = @board.turn_count
    until trn < @board.turn_count
      @board.update(current_player.move(@board), current_player)
    end
  end

  def play
    until self.over? == true
      puts " "
      @board.display
      self.turn
    end
    if self.won?
      @board.display
      puts "Congratulations #{self.winner}!"
    elsif self.draw? == true
      puts "Cat's Game!"
    end
  end

  def start
    puts "How many players? (0, 1, or 2)"
    until playercount == "0" || playercount == "1" || playercount == "2"
      @playercount = gets.strip
    end
    puts "Who should go first and be X? Player (1 or 2)?"
    puts "(If it's a 1 player game, player 2 is the AI)"
    until first_player == "1" || first_player == "2"
      @first_player = gets.strip
    end

    case @playercount
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
    when "1"
      self.set_first_player
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
    end
  end

  def set_first_player
    if first_player == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    elsif first_player == "2"
      @player_2 = Players::Human.new("O")
      @player_1 = Players::Computer.new("X")
    end

  end

end
