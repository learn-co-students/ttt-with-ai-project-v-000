class Game
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  
  def divide_turns
    puts "\n=================================\n\n"
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    ( draw? || won? ) ? true : false
  end
  
  def play
    until over?
      divide_turns
      turn
    end
    puts
    draw? ? puts("Cat's Game!") : puts("Congratulations #{winner}!")
    puts
  end
  
  def start
    
    puts "Welcome to Tic-Tac-Toe!"
    n_players = nil
    until [0,1,2].include? n_players
      puts "Please enter the number of players (0-2):"
      n_players = gets.strip.to_i
    end
    
    case n_players
    
    when 0
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      play
      
    when 1
      simulator = nil
      until [1,2].include? simulator
        puts "Please enter the simulated player number (1-2):"
        simulator = gets.strip.to_i
      end
      simulator==1 ? self.player_1 = Players::Computer.new("X") : self.player_2 = Players::Computer.new("O")
      puts "Let's play!"
      puts
      board.display_reference
      play
      
    when 2
      puts "Let's play!"
      puts
      board.display_reference
      play
    end
    
  end
  
  def turn
    usr_input = nil
    until board.valid_move?(usr_input)
      usr_input = current_player.move(board)
    end
    board.update(usr_input,current_player)
    board.display
  end
  
  def winner
    if won?
      (won?-board.positions(player_1)).empty? ? player_1.token : player_2.token
    end
  end
  
  def won?
    p1 = board.positions(player_1)
    p2 = board.positions(player_2)
    win = WIN_COMBINATIONS.select do |win|
      win if ( (win-p1).empty? || (win-p2).empty? )
    end
    win.empty? ? false : win[0]
  end
  
end