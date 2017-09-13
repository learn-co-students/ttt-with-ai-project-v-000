require 'pry'

class Game

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def board
    @board
  end

  def board=(board)
    @board = board
  end

  def player_1
    @player_1
  end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2
    @player_2
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def current_player
    oddoreven = @board.turn_count
    if oddoreven.even?
      return player_1
    else
      return player_2
    end
  end

  def over?
    if full?
      return true
    elsif won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |set|
      position_1 = board.cells[set[0]]
      position_2 = board.cells[set[1]]
      position_3 = board.cells[set[2]]
      if position_1 == position_2 && position_2 == position_3 && board.taken?(set[0] + 1)
        return set
      end
    end
    return false
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def full?
    board.full?
  end

  def winner
    if won? != false
      return @board.cells[won?[0]]
    end
  end

  def turn
    moveturn = current_player.move(board)
    while @board.valid_move?(moveturn) == false
      moveturn = current_player.move(board)
    end
    if @board.valid_move?(moveturn)
      @board.update(moveturn, current_player)
      moveturn
    end
  end

  def play
    board.display
    while over? == false
      turn
      board.display
      won?
      draw?
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
