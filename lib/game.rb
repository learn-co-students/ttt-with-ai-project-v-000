require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS=[
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]]


  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    #is there a better way? less literal?
    # def initialize(player_1, player_2, board)
    @board = board
    @player_1 = player_1
    @player_2 = player_2

  end

  def current_player
    counter = 0
    board.cells.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
      counter % 2 == 0 ? player_1 : player_2
  end

  def over?
    if won? || draw?
      true
    end
  end

  def won?

    WIN_COMBINATIONS.detect do |win|

    if position_taken?(win[0]) && position_taken?(win[1]) && position_taken?(win[2]) && board.cells[win[0]] ==
      board.cells[win[1]] && board.cells[win[0]] == board.cells[win[2]]
      [win[0],win[1], win[2]]
    end
    end
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def full?
    unless board.cells.include?(" ")
      return true
    end
  end

  def position_taken?(location)
    !(board.cells[location].nil? || board.cells[location] == " ")
  end

  def winner
    if win = won?
      return board.cells[win[0]]
    else
       nil
    end
  end

  def move (position, player)
    board.cells[position.to_i-1] = player
  end

  def turn
      move = current_player.move(@board)

      if board.valid_move?(move)
        board.update(move, current_player)
      else
        "invalid"
        turn
      end

    board.display
  end

  def play
    until over?
      turn
    end
    if won?
      winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end