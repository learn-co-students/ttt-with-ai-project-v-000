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

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #pulls board.turn_count method to determine turn amounts
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]] &&
        board.cells[combo[0]] != " "

        # winnner combo [1,4,7]
        # combo[0] or 1 == combo[1] or 4
        # && combo[1] or 4== combo[2] or 7
    end
  end

  def draw? # board.full method true for full board/false in progress then won? method
    board.full? && !won?
  end

  def over? #pulls won? method or draw? method
    won? || draw?
  end

  def winner #returns winner or no winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn # determine valid move and changes player
    puts = "It's now #{current_player.token}'s turn.'"
    puts = "Please enter number 1-9:"
    input = current_player.move(board).to_i
    if board.valid_move?(input.to_s)
      board.update(input, current_player)

      board.display
    else
      puts "That is an invalid move."
      puts = "Please enter number 1-9:"  
      board.display
      turn
    end
    board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
