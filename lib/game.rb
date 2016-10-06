class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :board, :player_1, :player_2, :winning_combo

  @@draw_count = 0

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def draw?
    draw = false
    if @board.full?
      if self.won? == false
        draw = true
      end
    end
    draw
  end

  def draw_count
    @@draw_count
  end

  def draw_count=(draw_count)
    @@draw_count = draw_count
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def turn
    m = self.current_player.move(@board)

    if @board.valid_move?(m)
      @board.update(m, self.current_player)
      @board.display
      puts "#{self.current_player.token}'s turn"
    else
      self.turn
    end
  end

  def play
    @board.reset!
    while self.over? == false
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
      if "X" == self.winner
        @player_1.win_count = @player_1.win_count + 1
      else
        @player_2.win_count = @player_2.win_count + 1
      end
    elsif self.draw?
      puts "Cats Game!"
      @@draw_count += 1
    end
  end

  def play_again?(input)
    if input == 'y'.downcase
      Game.new.start
    elsif input == 'n'.downcase
      puts "Goodbye!"
    else
      puts "Invalid input.\nPlay again? Y/N"
      self.play_again?(gets.chomp)
    end
  end

  def start
    puts "What kind of game would you like to play? \n1. One player \n2. Two Player \n3. Zero Player"
    i = gets.chomp
    case i
    when "1"
      puts "Who should go first? \n1. Human \n2. Computer"
      j = gets.chomp
      if j == "1"
        puts "OK! You will go first"
        puts "#{self.current_player.token}'s turn"
        @player_2 = Players::Computer.new("O")
      elsif j == "2"
        puts "OK! The computer will go first."
        puts "#{self.current_player.token}'s turn"
        @player_1 = Players::Computer.new("X")
      else
        puts "That is not a valid input."
        self.start
      end
      @board.first_display
      self.play
    when "2"
      puts "OK! \'X\' goes first."
      @board.first_display
      self.play
    when "3"
      puts "OK! The computer will play itself."
      @board.display
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      self.play
    when "wargames"
      puts "WARGAMES"
      @board.display
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      100.times do
        @board.reset!
        self.play
      end
      puts "WARGAMES REPORT:"
      puts "X won #{@player_1.win_count} times."
      puts "O won #{@player_2.win_count} times."
      puts "There were #{@@draw_count} draws."
      @player_1.win_count = 0
      @player_2.win_count = 0
      @@draw_count = 0
    else
      puts "That is not a valid input."
      self.start
    end
    puts "Play again? Y/N"
    self.play_again?(gets.chomp)
  end

  def winner
    if self.won?
      @winning_combo[0]
    end
  end

  def won?
    win = false
    WIN_COMBINATIONS.each do |win_combo|
      win_check = [@board.cells[win_combo[0]], @board.cells[win_combo[1]], @board.cells[win_combo[2]]]
      if win_check == ['X', 'X', 'X'] || win_check == ['O', 'O', 'O']
        @winning_combo = win_check
        win = true
      end
    end
    win
  end
end
