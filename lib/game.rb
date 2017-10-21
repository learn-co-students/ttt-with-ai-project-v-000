
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

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
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

  def winner
    if won?
      self.board.cells[won?[1]]
    end
  end

  def turn
    puts "Please enter 1-9 #{current_player.token}"
    move = current_player.move(board)
    self.board.valid_move?(move) ? board.update(move, current_player) : self.turn
    self.board.display
  end
  #   # p1_move = player_1.move(board)
  #   current_player.move(board) if !board.valid_move?(move)

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

  def start
    game_type = nil
    puts "For a computer vs computer game type '0-player'"
    puts "For a human vs computer game type '1-player'"
    puts "For a human vs human game type '2-player'"
    game_type = gets.strip

    case game_type
    when "0-player"
      binding.pry
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      binding.pry
      puts "Game will now begin."
    when "1-player"
      binding.pry
      puts "Would you like to go first and be 'X'? type 'yes' or 'no'"
      input = gets.strip
      until input == "yes" || "no"
        puts "Would you like to go first and be 'X'? type 'yes' or 'no'"
        if input == yes
          self.player_2 = Players::Computer.new("O")
        else
          self.player_1 = Players::Computer.new("X")
        end
      end
      binding.pry
    when "2-player"
      puts "Player 1 will go first and be 'X'"
      puts "Player 2 will go next and be 'O'"
      puts "Game will now begin."
    end

    self.start unless game_type == "0-player" || game_type == "1-player" || game_type == "2-player"
  end

  def end
    puts "Game is now over."
    puts "To play again, type 'play'"
    puts "To quit, type 'exit'"
    input = gets.strip
    if input == "play"
      self.board.reset!
      self.start
    end
    self.end unless input == "exit"
  end

end
