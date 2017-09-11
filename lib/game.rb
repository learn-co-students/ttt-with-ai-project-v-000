
class Game

  attr_accessor :board, :player_1, :player_2, :cells

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    # binding.pry
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

    def board
      @board
    end

    def player_1
      @player_1
    end

    def player_2
      @player_2
    end

    def current_player
      if @board.turn_count % 2 === 0
        player_1
      else
        player_2
      end
    end

    def over?
      if @board.full? || won? || draw?
        # binding.pry
        true
      else
        false
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        # binding.pry
        p1 = @board.cells[combo[0]]
        p2 = @board.cells[combo[1]]
        p3 = @board.cells[combo[2]]

        if p1 == p2 && p2 == p3 && p3 != " "
          return combo
        else
          false
       end
      end
    end

    def draw?
      if @board.full? && !won?
        true
      else
        false
      end
    end

    def winner
      if won?
        @board.cells[won?[0]]
      else
        nil
      end
    end

    def turn
      #determine the current player
      #ask that player to make a move via the move method
      #IF the player did NOT make a valid move
      #run turn again
      #else
      player = current_player
      move = player.move(@board)
      if @board.valid_move?(move)
        @board.update(move, player)
      else
        turn
      end
    end

    def play
      until over? || draw?
        turn
      # binding.pry
      end
      if won?
        puts "Congratulations #{winner}!"
      else draw?
       puts "Cat's Game!"
     end
   end
end
