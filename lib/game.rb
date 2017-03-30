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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
    @board = board if board
    self.play
  end

  def current_player
    x_count = self.board.cells.count {|cell| cell == "X"}
    o_count = self.board.cells.count {|cell| cell == "O"}
    if x_count > o_count
      return player_2
    else
      return player_1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if ((self.board.cells[win_combination[0]]) == (self.board.cells[win_combination[1]])) &&
        ((self.board.cells[win_combination[1]]) == (self.board.cells[win_combination[2]])) &&
        ((self.board.cells[win_combination[0]]) != " ") &&
        ((self.board.cells[win_combination[1]]) != " ") &&
        ((self.board.cells[win_combination[2]]) != " ")
        return true
      end
    end
    return false
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if self.board.cells.count("X") > self.board.cells.count("O")
      return "X"
    else
      return "O"
    end
  end

  def play
    turns = 0
    while turns < 10
      if won?
        puts "Congratulations #{winner}!"
        break
      elsif draw?
        puts "Cat's Game!"
        break
      elsif over?
        break
      else
        turn
      end
      turns += 1
    end
  end

  def turn
    location = self.current_player.move(board)
    if self.board.valid_move?(location)
      self.board.update(location, current_player)
      self.board.display
    else
      turn
    end
  end

  def over?
    true if draw? || won? && self.board.full?
  end

  def self.start
    puts "Hello! Welcome to the game Tic Tac Toe!"
    puts "What kind of game would you like to play? 0, 1, or 2 player?"
    game_kind = gets.strip
    if game_kind == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    elsif game_kind == "1"
      puts "Who should go first and be X? Human or Computer?"
      first_player = gets.strip
      if first_player == "Human"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      elsif first_player == "Computer"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      end
    elsif game_kind == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    end


    puts "Would you like to play again (Y/N)?"
    play_again = gets.strip.upcase
    if play_again == "Y"
      start
    elsif play_again == "N"
      puts "Goodbye."
    else
      puts "I'm sorry, that is not a valid answer. Goodbye."
    end
  end

end
