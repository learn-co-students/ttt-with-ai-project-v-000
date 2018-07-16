class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    #horizontal
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #vertical
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #diagonal
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    self.board.reset!
    greeting
    self.game_mode
  end

  def play
    while !self.over?
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def current_player
    value = @board.turn_count
    value.even? ? @player_1 : @player_2
  end

  def turn
    @board.display
    puts "Please enter 1-9:"
    move = current_player.move(self)
    if @board.valid_move?(move)
      @board.update(move, current_player)
    else
      self.turn
    end
  end

  def winner
    won = self.won?
    return nil if won == false
    if won.all? {|cell| @board.cells[cell] == "X" }
      "X"
    elsif won.all? {|cell| @board.cells[cell] == "O" }
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |cell_group|
      board_pos = [@board.cells[cell_group[0]], @board.cells[cell_group[1]], @board.cells[cell_group[2]]]

      if board_pos.all? { |cell| cell == "X" } || board_pos.all? { |cell| cell == "O" }
        return cell_group
      end
    end
    return false
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

end#endof class
