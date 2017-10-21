class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = self.board.turn_count
    turn % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    self.board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      position_1 = self.board.cells[combo[0]]
      position_2 = self.board.cells[combo[1]]
      position_3 = self.board.cells[combo[2]]

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return position_1
      end
    end
    false
  end

  def draw?
    self.over? && !self.won? ? true : false
  end

  def winner
    if self.won?
      return self.won?
    end
  end

  def turn
    self.board.display
    puts "Enter a valid move(1-9): "
    input = self.current_player.move(self.board)

    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      puts "Enter a valid move(1-9): "
      input = self.current_player.move(self.board)
    end
  end

  def play
    until self.won? || self.draw?
      self.turn
    end

    self.board.display

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Would you like to play a game?"
    puts "1. Tic-Tac-Toe (computer vs. computer)"
    puts "2. Tic-Tac-Toe (human vs. computer)"
    puts "3. Tic-Tac-Toe (human vs. human)"

    input = gets.chomp

    if input == "1"
      self.player_1 = Computer.new("X")
      self.player_2 = Computer.new("O")
    elsif input == "2"
      puts "Who goes first human or computer?"
      player_setup_input = gets.chomp

      if player_setup_input.downcase == "human" || player_setup_input.downcase == "1"
        self.player_2 = Computer.new("O")
      elsif player_setup_input.downcase == "computer" || player_setup_input.downcase == "2"
        self.player_1 = Computer.new("X")
      end
    elsif input == "3"
      puts "X goes first."
    end

    self.play

    if self.draw? || self.won?
      puts "Would you like to play again? (y/n)"
      input = gets.chomp
      if input.downcase == "y" || input.downcase == "yes"
        self.board.reset!
        self.start
      end
    end
  end
end
