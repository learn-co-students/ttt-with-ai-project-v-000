class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

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

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    if self.draw? || self.won?
      true
    else
      false
    end
  end

  def win_combination
    test = WIN_COMBINATIONS.find do |combination_array|
       if combination_array.all? { |index| board.cells[index]=="X" }
             true
       elsif combination_array.all? { |index| board.cells[index]=="O"}
              true
       else
           false
       end
     end
  end

  def won?
    return true if self.win_combination != nil
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if win_combination == nil
      nil
    else
      index = win_combination[0]
      self.board.cells[index]
    end
  end

  def turn
    move = self.current_player.move(@board)
    current_player = self.current_player
    puts "Please make your move"
    until self.board.valid_move?(move)
      puts "Please enter a valid move"
      move = self.current_player.move(@board)
    end
    self.board.update(move,current_player)
  end

  def play
    until self.over?
      puts "#{self.board.turn_count}"
      self.turn
      self.board.display
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

end
