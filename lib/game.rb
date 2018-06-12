require "pry"
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      board.cells[win[0]] == board.cells[win[1]] &&
      board.cells[win[1]] == board.cells[win[2]] &&
      (board.cells[win[0]] == "X" || board.cells[win[0]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "Please take your turn."
    input = current_player.move(input).to_i
    if board.valid_move?(input.to_s)
       board.update(input, current_player)
       board.display
    elsif !input.between?(1, 9)
      puts "That is an invalid move."
      turn
    else
      puts "That position is taken, please try again."
    end
  end

  def play
    puts "Please take your turn."
    if input = current_player.move(input).to_i
    else input = current_player.move(input).to_i == false
    until over? || won?
      turn
    end
     if board.valid_move?(input.to_s)
      board.update(input, current_player)
      turn

      elsif draw?
        puts "Cat's Game!"
     else won?
        puts "Congratulations #{winner}!"
      end
      over?
    end
  end
# end
