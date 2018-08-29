class Game

  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0 
      @player_1
    else
      @board.turn_count % 2 == 1
        @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if board.cells[combination[0]] == "X" && board.cells[combination[1]] == "X" && board.cells[combination[2]] == "X" || board.cells[combination[0]] == "O" && board.cells[combination[1]] == "O" && board.cells[combination[2]] == "O" 
        return combination
      end
    end
    return false
  end
  
  def draw?
    if board.full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw? || board.full?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    end
  end
  
  def turn
    current_move = current_player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move, current_player)
      board.display
    else
      puts "Invalid Move"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
  def self.choice_zero
    computer_1 = Players::Computer.new("X")
    computer_2 = Players::Computer.new("O")
    Game.new(computer_1, computer_2).play
    puts "Would you like to play again? (Y/N)"
    input2 = gets.strip
    if input2 == "Y"
      Game.start
    end
  end
  
  def self.choice_one
    human_1 = Players::Human.new("X")
    computer_2 = Players::Computer.new("O")
    Game.new(human_1, computer_2).play
    puts "Would you like to play again? (Y/N)"
    input2 = gets.strip
    if input2 == "Y"
      Game.start
    end
  end
  
  def self.choice_two
    human_1 = Players::Human.new("X")
    human_2 = Players::Human.new("O")
    Game.new(human_1, human_2).play
    puts "Would you like to play again? (Y/N)"
    input2 = gets.strip
    if input2 == "Y"
      Game.start
    end
  end
  
  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts " "
    puts "Would you like to play, 0, 1, or 2 player game? Please enter 0, 1, or 2:"
    input = gets.strip
    if input == "0"
      choice_zero
    elsif input == "1"
      choice_one
    elsif input == "2"
      choice_two
    else
      puts "Invalid input, please enter 0, 1, or 2:"
    end
  end

end
