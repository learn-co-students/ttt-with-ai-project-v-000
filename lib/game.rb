require 'pry'

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
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
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      board.taken?(combo[0] + 1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
      # if all taken && all the same return that combo
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  # def winner
  #  won? ? board.cells[won?.first] : nil
  # end

  def winner
    if won? && !draw?
       board.cells[won?[0]]
    else
      nil
    end

  end


  def turn
    puts "Player #{current_player}, enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
        board.update(input, current_player)
        board.display
    else
      turn
    end
  end

  def play
    puts "GAME STARTED"
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end



end
