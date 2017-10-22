class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS =[
     [0,1,2], # Top row
     [3,4,5], # Middle row
     [6,7,8], # Bottom row
     [0,3,6], # Left Column
     [1,4,7], # Middle Column
     [2,5,8], # Right Column
     [0,4,8], # Diagonal left to right
     [2,4,6]  # Diagonal right to left
   ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   		@board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      a = board.turn_count
      if a.even?
        return @player_1
      else
        return @player_2
      end
    end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
          return true
        elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
          return true
        end
      end 
      false
    end

    def draw?
       board.full? && !won? ? true : false
    end

    def winner
        if won?
          WIN_COMBINATIONS.each do |combo|
            if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
              return "X"
            elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
              return "O"
            end
          end
        else 
          nil
        end
    end

    def turn
      player = current_player
      choice = player.move(@board)
        if @board.valid_move?(choice)
            @board.update(choice, player)
        else 
            turn 
        end
    end

   def play
      board.display
      until over? 
        turn
        board.display
      end
      
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
    

end










