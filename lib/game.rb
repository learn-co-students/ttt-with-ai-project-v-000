class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :won

  WIN_COMBINATIONS =
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1
  end

  def over?
    won? || draw?
  end

  def won?
    @won = []
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == " "
        false
      elsif @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]]
        @won = combo
      end
    end
  end

  def draw?
    !(won?) && @board.full?
  end

  def winner
    won? ? @board.cells[@won[1]] : nil
  end

  def turn
    puts "Player #{current_player.token}'s turn!\n"
    puts "Where would you like to move? (1-9):\n"
    @board.display
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "That number is invalid."
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
      return true
    elsif draw?
      puts "Cat's Game!"
      @board.display
      return false
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players would you like? Enter 0, 1, or 2."
    input = gets.strip
    if input == "2"
      Game.new.play
    elsif input == "1"
      puts "Do you want to be X or O?"
      pick = gets.strip.upcase
      if pick == "X"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
    elsif input == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    end
    puts "Play again? (Y/N)"
    again = gets.strip.upcase
    again == "Y" ? (Game.new.start) : (puts "Thanks for playing!")
  end
end
