class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != " "
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = current_player
    move = player.move(board)
    if self.board.valid_move?(move)
      self.board.update(move, player)
      self.board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def prompt(message)
    puts("=> #{message}")
  end

  def start
    welcome = <<-MSG
    Welcome to Tic Tac Toe!
    How many players will play today? (Input 0, 1, or 2)
    Computer vs Computer --->  0
    Player vs Computer   --->  1
    Player vs Player     --->  2
    MSG

    prompt(welcome)
    choice = ""
    loop do
    choice = gets.strip
    if %w(0 1 2).include?(choice)
    if choice.to_i == 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    elsif choice.to_i == 1
      puts "Type '1' to play first, '2' to play second:"
      input = gets.strip
        if input.to_i == 1
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        elsif input.to_i == 2
          Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
        end
    elsif choice.to_i == 2
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    end
    break
  else
    puts "That's not a valid choice"
  end
end

    puts "Play again? (y/n)"
    input = gets.strip.downcase

    if input == "yes" || input == "y"
      game = Game.new.start
    else
      puts "Thanks for playing!"
    end
  end
end
