
class Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def reset! #when called will reset Game attributes to initial state.
    self.player_1 = Players::Human.new("X")
    self.player_2 = Players::Human.new("O")
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
        if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"}
          combo
        end
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def winner  # Unless won? returns true, local variable won won't be assigned, if statement won't run, and winner method returns false value.
    if won = won?
      self.board.cells[won.first]
    end
  end

  def turn
    puts "Please enter 1-9 #{current_player.token}"
    move = current_player.move(board)
    self.board.valid_move?(move) ? board.update(move, current_player) : self.turn
    self.board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

  def start  # gets called from CLI initially then optionally from Game.end
             # gives game options, based on selection sets Game attributes,
             # calls #play method to begin game play.
    game_type = nil
    puts "For a computer vs computer game type '0-player'"
    puts "For a human vs computer game type '1-player'"
    puts "For a human vs human game type '2-player'"
    game_type = gets.strip

    case game_type
    when "0-player"
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      puts "Game will now begin."
    when "1-player"
      input = ""
      until input == "no" || input == "yes"
        puts "Would you like to go first and be 'X'? type 'yes' or 'no'"
        input = gets.strip
        if input == "yes"
          self.player_2 = Players::Computer.new("O")
        elsif input == "no"
          self.player_1 = Players::Computer.new("X")
        end
      end
    when "2-player"
      puts "Player 1 will go first and be 'X'"
      puts "Player 2 will go next and be 'O'"
      puts "Game will now begin."
    end

    self.start unless game_type == "0-player" || game_type == "1-player" || game_type == "2-player"
    self.play
  end

  def end  # once Game.start gets called initially from CLI, Game.end gets
           #called from CLI.  Gives option to exit or play again => if chosen  # will reset board and Game attributes to initial state and call Game.start
    puts "Game is now over."
    puts "To play again, type 'play'"
    puts "To quit, type 'exit'"
    input = gets.strip
    if input == "play"
      self.board.reset!
      self.reset!
      self.start
    end
    self.end unless input == "exit"
  end

end
