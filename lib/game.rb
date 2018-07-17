class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [2,5,8],
      [1,4,7],
      [0,4,8],
      [6,4,2]
    ]

    def board
      @board
    end

    def player_1
      @player_1
    end

    def player_2
      @player_2
    end


    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end


    def current_player
      if @board.turn_count.even? #has access to turn_count b/c we make a new instance of board class above and set it equal to this
       @player_1
      else
       @player_2
      end
    end

    def won?
      win_array = false
      new_board = board.cells
      WIN_COMBINATIONS.each do |array|
        if new_board[array[0]] == "X" && new_board[array[1]] == "X" && new_board[array[2]] == "X" || new_board[array[0]] == "O" && new_board[array[1]] == "O" && new_board[array[2]] == "O"
          win_array = array
        end
      end
      win_array
    end
    #can't call @board[0]because it's not an array, it's an object...call board.cells

    def draw?
      if won? == false && @board.full? == true
        true
      else
        false
      end
    end

    def over?
      if won? || @board.full? || draw?
        true
      else
        false
      end
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

    def turn
      choice = current_player.move(board) #wasn't working with gets, this goes back and gets the players input through move
      choice = choice.to_i
      if board.valid_move?(choice)
        board.update(choice, current_player)
        board.display
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
      elsif draw?
        puts "Cat's Game!"
      end
    end

  def start

      puts "Welcome to Tic Tac Toe!"

      puts "How many players? 0, 1, or 2?"

      input = gets.strip.to_i

    if input == 0
        player_uno = Players::Computer.new
        player_dos = Players::Computer.new
          puts "Which Computer should go first? 1 or 2?"
          answer = gets.strip.to_i
            if answer == 1
              game = Game.new(player_uno("X"), player_dos("O"))
            else
              game = Game.new(player_dos("X"), player_uno("O"))
            end
    elsif input == 1
        player_uno = Players::Computer.new
        player_dos = Players::Human.new
          puts "Which should go first? Computer or human?"
            answer = gets.strip
          if answer == "Computer"
            game = Game.new(player_uno("X"), player_dos("O"))
          else
            game = Game.new(player_dos("X"), player_uno("O"))
          end

    elsif input == 2
      player_uno = Players::Human.new
      player_dos = Players::Human.new
        puts "Which player should go first? 1 or 2?"
        answer = gets.strip.to_i
          if answer == 1
            game = Game.new(player_uno("X"), player_dos("O"))
          else
            game = Game.new(player_dos("X"), player_uno("O"))
          end
    end
    end

    




end
