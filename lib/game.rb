class Game
  attr_accessor :board, :player_1, :player_2, :winner_counter

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @winner_counter = 0
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
        return true
      end
    end
    false
  end

  def draw?
    won? == false && @board.full? ? true : false
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
        return @board.cells[combo[0]]
      end
    end
    nil
  end

  def turn
    # binding.pry
    input = current_player.move(@board)
    while @board.valid_move?(input) == false
      puts "This move is not valid"
      input = current_player.move(@board)
    end
    # binding.pry
    @board.update(input, current_player)
    # binding.pry
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
      @winner_counter += 1
      board.display
    end
  end
end# class game
