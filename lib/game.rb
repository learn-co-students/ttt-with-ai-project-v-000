class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def start
    puts "***********************".colorize(:yellow)
    puts "Welcome to Tic Tac Toe!\n".colorize(:yellow)
    self.board.display_reference
    sleep(0.5)
    puts "Select one Option to Play <0/1/2>\n".colorize(:color => :black, :background => :white)
    sleep(0.5)
    puts "Computer will play itself <0>".colorize(:red)
    sleep(0.2)
    puts "Play against Computer <1>".colorize(:green)
    sleep(0.2)
    puts "Play against an Opponent <2>".colorize(:blue)
    input = gets.chomp.to_i

    case input
    when 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play

    when 1
      puts "Who starts? Computer <0> / Human <1>".colorize(:color => :black, :background => :white)
      token_chosen = gets.chomp.to_i
      if token_chosen == 1
        puts "You start, good luck!".colorize(:yellow)
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif token_chosen == 0
        puts "Computer starts, good luck!".colorize(:yellow)
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      else
        self.start
      end

    when 2
      puts "Choose your token <X/O>".colorize(:color => :black, :background => :white)
      token_chosen = gets.chomp
      if token_chosen == "x" || token_chosen == "x".upcase
        puts "You chose X, good luck!".colorize(:yellow)
        self.play
      else
        puts "You chose O, good luck!".colorize(:yellow)
        Game.new(Players::Human.new("O"), Players::Human.new("X")).play
      end
    end
    self.another_round
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #columns
    [0, 4, 8], [2, 4, 6]  #diagonals
  ]

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do | combo |
      if self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X" || self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"
        combo
      else
        false
      end
    end
  end

  def full?
    self.board.cells.all? { | i | i != " " }
  end

  def draw?
    self.board.cells.all? { | i | i != " " } && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if winner = won?
      self.board.cells[winner[0]]
    end
  end

  def turn
    player = current_player
    puts "Player #{player.token}'s turn:".colorize(:yellow) if player.is_a? Players::Human
    player_move = player.move(board).to_i
    if self.board.valid_move?(player_move)
      self.board.update(player_move, player)
      self.board.display
    else
      puts "That position is taken, try again".colorize(:red)
      turn
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def another_round
    puts "Keep playing? <Y/N>".colorize(:color => :black, :background => :white)
    user_input = gets.chomp
    if user_input == "y" || user_input == "Y"
      self.start
    elsif user_input == "n" || user_input == "N"
      puts "-----GAME OVER-----".colorize(:red)
    else
      self.another_round
    end
  end
end
