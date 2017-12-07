class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                      [0,3,6], [1,4,7], [2,5,8],
                      [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board=board
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    if (@board.cells.find_all {|t| t == "X" || t=="O"}).size % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def over?
    #binding.pry
    #if @board.cells.detect {|space| space == " "}
    #  return false
    #else
    draw? || won? #
    #end # true
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]]  &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
    #binding.pry
  end

  def draw?
    @board.full? && !won?
=begin
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]]  &&  @board.cells[combo[1]] == @board.cells[combo[2]]
        return false
      end
    end
    return true
=end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]]  &&  @board.cells[combo[1]] == @board.cells[combo[2]]
        if @board.cells[combo[0]] != " "
          return @board.cells[combo[0]]
        end
      end
    end

    return nil
  end

  def turn
    player = current_player
    #binding.pry
    current_move = player.move(@board)
    if !@board.valid_move?(current_move.to_i)
      turn
    else
      @board.display
      @board.update(current_move, player)
      @board.display
    end
  end

  def play
    while !over?
      turn
      #binding.pry
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
