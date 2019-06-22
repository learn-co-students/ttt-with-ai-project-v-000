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
      !won? && @board.full?
    end

    def over?
      won? || draw?
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

    def turn
      choice = current_player.move(board) #wasn't working with gets b/c nothing was passed in, this goes back and gets the players input through move
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


end
