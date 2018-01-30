class Game
  # class WIN_COMBINATIONS

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  # def initialize
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
        #  binding.pry
          if board.valid_move?(current_move) # checks if "1" is a valid move choice, if so, updates the board
            board.update(current_move, player)
            puts "Player #{player.token} moved to #{current_move}:"
            board.display
            # current_player > is this not needed as a return?
          else
            turn #otherwise ask for input again
         end
      end

      def play
        player = current_player
        if !over?
          then player.move(board)
           turn
        end
      end

end
