class Game 
  WIN_COMBINATIONS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                       [0, 3, 6], [1, 4, 7], [2, 5, 8],
                       [0, 4, 8], [2, 4, 6] ]
  attr_accessor :board 
  attr_accessor :player_1, :player_2
  
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)   
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board 
  end 
  
  def current_player
    @board.turn_count % 2 == 0? player_1 : player_2
  end  
  
  def won? 
    win_line = WIN_COMBINATIONS.detect {|line| @board.cells[line[0]] == @board.cells[line[1]] && @board.cells[line[1]] == @board.cells[line[2]] && @board.taken?(line[0] + 1)}
    if win_line != nil
      return win_line
    else
      return false
    end
  end
  
  def draw?
    if !won? && @board.cells.all? {|item| item == "X" || item == "O"}
      return true
    else
      return false
    end
  end
  
  def over? 
    if won? || draw?
      return true
    else
      return false
    end
  end
  
  def winner 
   if won? == false 
      nil 
    else
      @board.cells[won?[0]]
    end 
  end 
  
  def start 
    # puts "Welcoem to the Tic Tac Toe with AI Game!"
    # puts "A 0-player game has two computer players playing against each other. "
    # puts 'A 1-player game has a human playing against a computer.'
    # puts "A 2-player game has two human players."
    # puts "What kind of game do you want to play? 0-player enter 0, 1-player enter 1, or 2-player enter 2:"
    # n = gets.chomp.to_i 
    # case n 
    #   when 0 
    #     @player_1 = Players::Computer.new("X")
    #     @player_2 = Players::Computer.new("O")
    #   when 1 
    #     @player_1 = Players::Human.new("X")
    #     @player_2 = Players::Computer.new("O")
    #   when 2 
    #     @player_1 = Players::Human.new("X")
    #     @player_2 = Players::Human.new("O")
    #   else 
    #     puts "Invalid choice"
    # end
    
    play
  end 
  
  def play
    while !over?   
      turn
    end
    
    if over? && won?
      w = winner
      puts "Congratulations #{w}!"
    end 
    
    if over? && draw?
      puts "Cat's Game!"
    end 
  end
  
  def turn 
    player = current_player
    num = player.move(@board)
    if @board.valid_move?(num)
        @board.cells[num.to_i - 1] = player.token
        @board.display
        
    else
        puts "That is not a valid move!"
        player.move(@board)
    end
  end  
end 