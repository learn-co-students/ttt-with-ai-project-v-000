
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
  [2,4,6]
  ]
  
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  
  def board
    @board
  end
  
  
  def current_player
    count = @board.turn_count
    count.even? ? @player_1 : @player_2
  end
    
    
  def won?
    WIN_COMBINATIONS.each do |combo|
    board = @board.cells
      wc = board[combo[0]],board[combo[1]],board[combo[2]]
      
      if wc.all?{|cell| cell == "X"}
        puts combo
        return combo
      elsif wc.all?{|cell| cell == "O"}
        puts combo
        return combo
      end
    end
    false
  end
  
  
  def draw?
    if (won? == false && @board.full? == true)
      puts "Cat\'s Game!"
      true
    else
      false
    end
  end
  
  
  def over?
    won? || draw? ? true : false
  end
  
  
  def winner
    
    if won?
      xs = @board.cells.count("X")
      os = @board.cells.count("O")

      if xs > os
        puts "Congratulations X!"
        winner = "X"
      else
        puts "Congratulations O!"
        winner = "O"
      end
      return winner
    end
    return nil
  end
  
  
  def turn 
    puts "Please enter 1-9:"
    input = current_player.move(@board)
    
    if @board.valid_move?(input)
      puts "move valid #{input}"
      @board.update(input,current_player)
      @board.display
    else
      turn
    end
  end
    
  
  def play
    @board.display

    until over? == true
      turn
    end
    winner
    draw?
  end
  
 
  def start  
    puts "Welcome to ttt"
    setup
  end
  
  def setup
    puts "How many humans will be playing? (0,1,2, wargame)"
    num_humans = gets.strip
    game_type(num_humans)
    
    puts "Would you like to play again? (Yn)"
    replay = gets.strip.downcase
    setup if replay == "y"
  end
  
  
  def game_type(num_humans)
    
    comp_x = Players::Computer.new("X")
    comp_o = Players::Computer.new("O")
    hum_x = Players::Human.new("X")
    hum_o = Players::Human.new("O")
    
    case num_humans
    
    when "0"
      Game.new(player_1=comp_x, player_2=comp_o).play
      
    when "1"
      puts "Are you making the first move (Yn)?"
      first = gets.strip.downcase
      
      if first == 'y'
        Game.new(player_1=hum_x, player_2=comp_o).play
      else 
        Game.new(player_1=comp_x, player_2=hum_o).play
      end
  
    when "2"
      Game.new(player_1=hum_x, player_2=hum_o).play
      
    when "wargame"
      100.times do 
        Game.new(player_1=comp_x, player_2=comp_o).play
      end
    else
      setup
    end
    
  end
end