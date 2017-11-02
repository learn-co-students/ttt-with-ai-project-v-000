class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def start
    puts "Welcome to Tic Tac Toe!\n".colorize(:red)
    self.board.display_reference
    sleep(0.8)
    puts "Select one Option to Play:\n".colorize(:color => :black, :background => :white)
    puts "-- Computer will play itself <0>".colorize(:magenta)
    puts "-- Play against Computer <1>".colorize(:yellow)
    puts "-- Play against an Opponent <2>".colorize(:cyan)
    input = gets.chomp.to_i
    case input

    when 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play

    when 1
      puts "Who starts?"
      puts "Computer <0> / Human <1>"
      token_chosen = gets.chomp.to_i
      if token_chosen == 1
        puts "You start, good luck!"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif token_chosen == 0
        puts "Computer starts, good luck!"
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      else
        self.start
      end

    when 2
      puts "Choose your token <X/O>"
      token_chosen = gets.chomp
      if token_chosen == "x" || token_chosen == "x".upcase
        puts "You chose X, good luck!"
        self.play
      else
        puts "You chose O, good luck!"
        Game.new(Players::Human.new("O"), Players::Human.new("X")).play
      end

    #when "wargames"
    #  100.times do
    #    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    #  end
    #  puts

    end
    self.another_round
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row
    [3, 4, 5], #middle_row
    [6, 7, 8], #bottom_row
    [0, 3, 6], #left_column
    [1, 4, 7], #middle_column
    [2, 5, 8], #right_column
    [0, 4, 8], #diagonal_1
    [2, 4, 6]  #diagonal_2
  ]

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do | wc |
      if self.board.cells[wc[0]] == "X" && self.board.cells[wc[1]] == "X" && self.board.cells[wc[2]] == "X" || self.board.cells[wc[0]] == "O" && self.board.cells[wc[1]] == "O" && self.board.cells[wc[2]] == "O"
        wc
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
      turn
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def another_round
    puts "Another round? <Y/N>"
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
