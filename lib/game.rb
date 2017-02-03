class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def won?
    if
   WIN_COMBINATIONS.each do |combo|
     a = combo[0]
     b = combo[1]
     c = combo[2]
      if (self.board.cells[a] == "X" && self.board.cells[b] == "X" && self.board.cells[c] == "X") ||
      (self.board.cells[a] == "O" && self.board.cells[b] == "O" && self.board.cells[c] == "O")
        return true
    end
  end
  else
    false
  end
 end

  def winner
    if
      WIN_COMBINATIONS.each do |combo|
        a = combo[0]
        b = combo[1]
        c = combo[2]
          if self.board.cells[a] == "X" && self.board.cells[b] == "X" && self.board.cells[c] == "X"
            return player_1.token
          elsif self.board.cells[a] == "O" && self.board.cells[b] == "O" && self.board.cells[c] == "O"
            return player_2.token
         end
       end
    else
      nil
    end
  end

  def play
    self.board.display
    until self.over?
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
      puts "Congratulations #{self.winner}!"
    end
  end

  def turn
    self.board.empty? ? player = player_1 : player = current_player
    move = player.move(self.board)
    if !self.board.valid_move?(move)
      puts
      "That is not a valid move"
      self.turn
    else
      self.board.update(move, current_player)
      self.board.display
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "Which mode would you like to play in?"
    puts "0 - Zero Player"
    puts "1 - One Player"
    puts "2 - Two Player"
    input = gets.chomp
      if input == "0"
        self.new(Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
      elsif input == "1"
        puts "Who should go first?"
        puts "1 - You"
        puts "2 - Computer"
        input = gets.chomp
          if input == "1"
            self.new(Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
          elsif input == "2"
            self.new(Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
          else
            puts "That is not a valid input."
            self.start
          end
      else self.new.play
      end
    puts "Would you like to play again?  y/n"
    input = gets.chomp
      if input == "y"
        self.start
     else
       exit
     end
   end

  end
