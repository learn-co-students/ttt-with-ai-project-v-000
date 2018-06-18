class Game
  attr_accessor :board, :player_1, :player_2
  
def play_game
  puts "Welcome! Let's play Tic Tac Toe!"
  puts "What kind of game would you like to play: 0, 1-, 2-player or wargames?"
  puts "Please press '0' for 0 player, '1' for 1 player,'2' for 2 player or 'W' for wargames."
  
  #binding.pry
end

def start
  play_game
  
input = gets.chomp
  
  if input == "0"
    board = Board.new
    game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
    play
   elsif input == "1"
      board = Board.new
      puts" Would you like to play first? 'Y' for yes, 'N' for no"
      new_input = gets.chomp
      
    if new_input == "Y"
      puts "Let's go!"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      board.display
      play
      
      elsif  new_input == "N"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
        board.display
        play
        else
        start
      end
        elsif input == "2"
          board = Board.new
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
          puts "Let's go!"
          board.display
          play
          elsif input == "w"
            board = Board.new
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
            100.times.collect { play }
            binding.pry
            puts "The game was won #{play.length.won?} times."
          else
            start
          end
end
  
    def end_game
      
      while game.over?
       puts "Would you like to play again?"
      new_input = gets.strip
      if new_input = "Y" || "yes"
        Game.new
      else
        exit
        end
      end
    end
 
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

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=(Board.new))
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    end
    
    

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        return combo
      end
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "invalid"
      turn
      board.display
    end
  end

  def draw?
      !won? && board.full?
  end


  def over?
    won? || draw?
  end

  def play
   while !over?
     turn
  end
   if draw?
     puts "Cat's Game!"
   elsif won?
     puts "Congratulations #{winner}!"
     board.display
   end
  end

    def winner
     if combo = won?
      @board.cells[combo[0]]
    end
  end


end
