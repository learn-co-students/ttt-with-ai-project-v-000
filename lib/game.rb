require 'pry'
class Game


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [0,4,8], [6,4,2], [2,5,8]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    count = 0
    board.cells.each {|i| count += 1 if i != " "}
    if count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    board.full?
  end

  def won?
    winning = []
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
        winning = combo
      end
    end
    if winning == []
      false
    else
      winning
    end
  end

  def draw?
    over? && won? == false
  end

  def winner
     if won? == false
       nil
     else
       board.cells[won?[1]]
     end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    until board.valid_move?(input)
      puts "Please enter 1-9:"
      input = current_player.move(board)
    end
    board.update(input, current_player)
  end

  def play
    while !over? && !won? && !draw?
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
#    binding.pry
  end

    
end
