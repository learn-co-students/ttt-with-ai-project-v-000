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
      puts "Please enter 1-9:"
      input =  gets.strip  #STDIN.gets.strip crashes #looks like i'm not receiving anything though but test suite should be
      #binding.pry
      index = input.to_i
      if @board.valid_move?(index)
        @board.update(index, current_player)
        @board.display
      else
        turn
      end
  end



end
