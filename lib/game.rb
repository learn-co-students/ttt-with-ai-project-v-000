require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), board=Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def current_player
    (@board.turn_count+1)%2==0 ? @player_2 : @player_1
  end

  def over?
    draw? or won? ? true : false
  end

  def won?
    win_combo = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|item| @board.cells[item]==@player_1.token} || combo.all? {|item| @board.cells[item]==@player_2.token}
        win_combo = combo
      end
    end
    win_combo
  end

  def draw?
    if @board.full? && won? == nil
      true
    else
      false
    end

  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    @board.display
    puts "Your move #{current_player.token}"
    position = current_player.move(@board)
    if @board.valid_move?(position)
      board.update(position, current_player)
    else
      puts "This move is not valid, please enter another (1-9)"
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if self.won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

end
