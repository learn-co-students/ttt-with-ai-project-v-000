class Game
  attr_accessor :board, :player_1, :player_2, :end_game

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    ##binding.pry
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |row|
      if board.cells[row[0]] != " " && board.cells[row[0]] == board.cells[row[1]] && board.cells[row[1]] == board.cells[row[2]]
        return row
      else
        false
      end
    end
  end

  def draw?
    !won? && board.full? ? true:false
  end

  def over?
    won? || draw? ? true:false
  end

  def winner
    won? == false ? nil:board.cells[won?[0]]
  end

  def turn
    puts "Please enter a number 1-9"
      board.display
      input = current_player.move(board)
      if board.valid_move?(input) == true
        board.update(input, current_player)
      elsif input == 'exit'
      @end_game = true
      else
        puts "Invalid move"
        turn
      end
  end

  def play
    until over? == true || end_game == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
      board.display
    elsif draw? == true
      puts "Cat's Game!"
      board.display
    end
  end

end
