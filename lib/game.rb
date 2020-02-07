class Game

  attr_accessor :player_1, :player_2, :board
  include Players

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

  def initialize(player_1= Human.new("X"), player_2= Human.new("O"), board=Board.new)
    puts "The game begins!"
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      return player_1
    else
      return player_2
    end
  end

  def over?
    @board.full?
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|index| @board.cells[index] == "X"}
        return combo
      elsif combo.all? {|index| @board.cells[index] == "O"}
        return combo
      end
    end
  won
  end

  def draw?
    if @board.full? && !self.won?
      return true
    else
      return false
    end
  end

  def winner
    won = self.won?
    if won
      return @board.cells[won[0]]
    else
      return nil
    end
  end

  def turn
    player = current_player
    input = 'invalid'
    while !@board.valid_move?(input)
      input = player.move(@board)
    end

    @board.update(input, player)
  end

  def play
    until over? || draw? || won?
      turn
      @board.display
    end

    if won?
      if @board.turn_count.even?
        puts "Congratulations #{@player_2.name}!"
        return @player_2
      else
        puts "Congratulations #{@player_1.name}!"
        return @player_1
      end
    elsif draw?
      puts "Cat's Game!"
      return nil
    end

  end


end
