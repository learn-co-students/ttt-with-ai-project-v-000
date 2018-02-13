class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [2,5,8],
      [1,4,7]
    ]


    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end


      def current_player
        #condition ? return value if true : return value
        @board.turn_count.even? ? @player_1 : @player_2
        #modulo
      end

        def over?
           @board.full?

        end

    def won?
      WIN_COMBINATIONS.detect do |win_indices|
        if @board.taken?(win_indices[0]) && @board.cells[win_indices[0]] == @board.cells[win_indices[1]] && @board.cells[win_indices[0]] == @board.cells[win_indices[2]]
           win_indices
        end
      end
    end

      def  draw?(cells)
        # @board.full?
         full?(cells) && !won?(cells)
      end



    # def winner
    #
    # end


    # def turn
    #
    # end
end
