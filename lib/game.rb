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

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even? ? player_1 : player_2
    end

    def won?
      WIN_COMBINATIONS.find do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]] &&
        board.cells[combo[0]] != " "
      end
    end

    def over?
      won? || draw?
    end

    def draw?
      board.full? && !won?
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

   def turn
     puts "It's #{current_player.token}'s turn."
     board.display
     input = current_player.move(board)
     if board.valid_move?(input)
       board.update(input, current_player)
     else
       puts "That Is An Invalid Move!"
       turn
     end
   end

   def play
     until over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
       board.display
     elsif draw?
       puts "Cat's Game!"
       board.display
     end
   end


   def start
    puts "What variation of Tic-Tac-Toe would you like to play?"
    puts "1. Human vs. Computer"
    puts "2. Human vs. Human"
    puts "3. Computer vs. Computer"
    puts "4. Exit Game!"
    input = gets.strip

    if input == "1"
      puts "Who shall go first and be (X)?"
      puts "1. Human"
      puts "2. Computer"
      input = gets.strip
      if input == "1"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
        elsif input == "2"
        game = Game.new(player_2 = Players::Computer.new("X"), player_1 = Players::Human.new("O"), board = Board.new)
        game.play
      end

     elsif input == "2"
       puts "Who shall go first and be (X)?"
       puts "1. Player 1"
       puts "2. Player 2"
       input = gets.strip
       if input == "1"
         game = Game.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new)
         game.play
       elsif input == "2"
         game = Game.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new)
         game.play
       end

     elsif input == "3"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new)
      game.play


    elsif input == "4"
    end
  end


  
end
