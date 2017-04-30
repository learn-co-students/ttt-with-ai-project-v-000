class Game
  attr_accessor :player_1, :player_2, :board

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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2 #oppure usa .odd?/.even?
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    #vado nelle combo vincenti e cerco se almeno una di quelle (fatta di indexes) ha, nei rispettivi posti indicati dagli indexes, tutti token uguali.
    WIN_COMBINATIONS.find do |win_combination|
      win_combination.all?{|index| board.cells[index] == "X"} ||
      win_combination.all?{|index| board.cells[index] == "O"}
    end
  end

  def winner
    #accedo direttamente all'array vincente usando un qualsiasi index (0..2) e chiamando won?[]. Perchè? Perchè won? restituisce un array di index vincenti!
    won? ? board.cells[won?[0]] : nil
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn
    board.display if @board.turn_count == 0
    puts "Please enter 1-9:"
    user_input = current_player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
      board.display
    else
      puts "Invalid move, please try again."
      board.display
      turn
    end
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end



end
