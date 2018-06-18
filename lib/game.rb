class Game
  include Players
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def board
    @board
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      if (@board.cells[combination[0]] == "X" && @board.cells[combination[1]] == "X" && @board.cells[combination[2]] == "X") || (@board.cells[combination[0]] == "O" && @board.cells[combination[1]] == "O" && @board.cells[combination[2]] == "O")
        return combination
      else
        
      end
    end
    return false
  end
  
  def draw?
    if @board.full?
      WIN_COMBINATIONS.each do |combination|
        if (@board.cells[combination[0]] == "X" && @board.cells[combination[1]] == "X" && @board.cells[combination[2]] == "X") || (@board.cells[combination[0]] == "O" && @board.cells[combination[1]] == "O" && @board.cells[combination[2]] == "O")
          return false
        else
          
        end
      end
      return true
    else
      return false
    end
  end
  
  def over?
    if draw?
      return true
    elsif won?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      return @board.cells[won?[0]]
    end
  end
  
  def turn
    move = current_player.move(@board)
    while !@board.valid_move?(move)
      move = current_player.move(@board)
    end
    @board.update(move, current_player)
    @board.display
  end
  
  def play
    while !over?
      turn
    end
    
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
  
  def start
    puts "Welcome to Tic-Tac-Toe"
    puts "0, 1, or 2 Players?"
    number_of_players = gets.strip.to_i
    
    puts "Who should go first?"
    first_player = gets.strip
    
    case first_player
    when "Human"
      case number_of_players
      when 0
        @player_1 = Computer.new("X")
        @player_2 = Computer.new("O")
      when 1
        @player_2 = Computer.new("O")
      when 2
        
      end
    when "Computer"
      case number_of_players
      when 0
        @player_1 = Computer.new("X")
        @player_2 = Computer.new("O")
      when 1
        @player_1 = Computer.new("X")
      when 2
        
      end
    end
    
    play
  end
  
  
end
