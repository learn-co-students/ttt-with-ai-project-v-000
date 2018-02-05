class Game
  # class WIN_COMBINATIONS

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

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

    def current_player
      if board.turn_count.even? # shouldn't this be odd??
        player_1
      else
        player_2
      end
    end

    def over?
      draw? || won?
    end

    def draw?
      full? && !won?
    end

    def full?
      board.cells.all? {|spot| spot != " "}
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
        position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
        position_3 = board.cells[win_index_3] # load the value of the board at win_index_3
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination # return the win_combination indexes that won.
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination # return the win_combination indexes (array) that won.
          end
        end
        return false
      end

      def winner
        if won?
          return board.cells[won?[1]]
        end
      end

      def turn
        player = current_player # 1 or 2 (object, x or o)
        current_move = player.move(@board) #this returns a string "1", which is what was entered by human
          if board.valid_move?(current_move) # checks if "1" is a valid move choice, if so, updates the board
            board.update(current_move, player)
            puts "Player #{player.token} moved to spot #{current_move}:"
            board.display
            # current_player > is this not needed as a return?
          else
            turn #otherwise ask for input again
         end
      end

      def play
        # player = current_player #sets player to current player (1 or 2)
        until over?
          # then player.move(board) # user will be asked for input
           turn
      end
        if won?
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
        end
    end



### CLI
    def start #evoke this in bin/tictactoe
      # 1. Greet user
      puts "Welcome to Tic Tac Toe! The fight to the death between X and O."
      puts "~~~~~~"
      # 2. Ask if they want 0, 1, or 2 player
      puts "Please enter 0 for a computer match, 1 for 1-player, and 2 for 2-player:"
      input = gets.strip
      # 3. Ask who is going first, they will be X
          # If 0, then.... computer simulation
          # If 1, use Human and Computer classes to play
          # If 2, ask for input using Human every turn
      if input == "2" #ONLY WORKS FIRST TIME IT IS ENTERED / CASE??
        two_player
      elsif input == "1"
        one_player
      elsif input == "0"
        computer_game
      else
        puts "Please enter 0 for a computer match, 1 for 1-player, and 2 for 2-player:"
        input = gets.strip
      end
      # 4. Initialize game with player 1 and play through the Game

      # 5. When over, ask if they want to play again, otherwise exit
    end

    def computer_game
    end

    def one_player #plays like normal game! doesn't make first move for computer
      input = ""
      puts "~~~~~~"
      while input != "human" || input != "computer"
      puts "Choose who will go first and be X. Please enter 'human' or 'computer':"

        input = gets.strip

        case input
        when "human"
          # player_1 = Players::Human.new("X")
          # player_2 = Players::Computer.new("O")
          # game = Game.new(player_1, player_2) >>This was creating a new game but not actually playing on it!
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
          # play
          new_game?
        when "computer"
          # player_2 = Players::Human.new("X")
          # player_1 = Players::Computer.new("O")
          # game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
          # play
          new_game?
        end
      end

    end

    def two_player
      puts "~~~~~~"
      puts "Decide who is going first. They will be playing for X." #they can choose a number, will be rand. generated, to decide who is first
      Game.new.play
      new_game?
      end
     end

     def new_game? #separate method to reduce space in method above!
       input = ""
       while input != "yes" || input != "no"
         puts "Do you want to play again? Enter 'yes' or 'no'." #can this line be equal to a variable?

         input = gets.strip
         case input
         when "yes"
           board.reset! #make sure to refresh the board first!
           start
         when "no"
           exit
         end
       end

end


# //Notes:
