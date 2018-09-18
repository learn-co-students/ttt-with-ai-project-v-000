class Game
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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 =  Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn_count
   counter = 0
   @board.cells.each do |playerinput|
     if playerinput == "X" || playerinput == "O"
       counter += 1
     end
   end
   counter
 end

 def current_player
   turn = turn_count
   turn.even? ? @player_1 : @player_2
 end

 def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      token_1 = @board.cells[win_index_1]
      token_2 = @board.cells[win_index_2]
      token_3 = @board.cells[win_index_3]

      if (token_1 == "X" && token_2 == "X" && token_3 == "X" ) || (token_1 == "O" && token_2 == "O" && token_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    return false if @board.cells.count(" ") > 0
    true
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || (full? && won? != false) || (won? != false && !full?)
      true
    else
     false
   end
  end

  def winner
    win_combination = won?
    if win_combination
      @board.cells[win_combination.first]
    else
      nil
    end
  end

  def turn
    playerinput = current_player.move(@board)
    if @board.valid_move?(playerinput)
      @board.cells[playerinput.to_i - 1] = current_player.token
      @board.display
      puts
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
    else draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe"
    puts "What kind of game would you like to play?"
    puts "1 - Two human players"
    puts "2 - One human player vs computer"
    puts "3 - computer vs computer"
    puts "4 - exit"
    input = gets.strip

    case input
    when "1"
      puts "Who goes first?"

      self.new().play
      play_again
    when "2"
      puts "Who should go first?"
      puts "1- Computer or 2- Human?"
      first = gets.strip
      if first == "1"
        self.new(Players::Computer.new("X"), Players::Human.new("O")).play
      else
        self.new(Players::Human.new("X"), Players::Computer.new("O")).play
      end
      play_again
    when "3"
      self.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      play_again
    else
      puts "byeee!"
    end
  end

  def self.play_again
    puts "Play again? Y/n"
    input = gets.strip

    if input == "Y" || input == "y"
      Game.start
    else
      puts "bye!"
    end
  end
end
