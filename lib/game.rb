class Game

  WIN_COMBINATIONS = [[2,5,8],[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [0,4,8], [6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
   if board.turn_count % 2 == 0
     player_1
   elsif board.turn_count % 2 == 1
     player_2
   end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
      board.cells[win_combination[0]] == board.cells[win_combination[2]] && board.cells[win_combination[0]] != " "
    end
  end


  def draw?
    if won? == nil && !board.full?
      false
    elsif won? == nil && board.full?
      true
    elsif won? != nil
      false
    end
  end

  def over?
    draw? || won? != nil
  end

  def winner
    if won? != nil
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    loop do
      input = current_player.move(board)
      if board.valid_move?(input)
      board.update(input, current_player)
      break
      else
        "invalid"
      end
    end
  end

  def play
    until over? || draw? do
      turn
      board.display
    end
    if over? && won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
