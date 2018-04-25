class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #<- Top-Row Win
    [3,4,5], #<- Middle-Row Win
    [6,7,8], #<- Bottom-Rown Win
    [0,3,6], #<- Left-Column Win
    [1,4,7], #<- Middle-Column Win
    [2,5,8], #<- Right-Column Win
    [0,4,8], #<- Left-Diagnal Win
    [6,4,2]] #<- Right-Diagnal Win

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      @board.turn_count % 2 == 0? @player_1 : @player_2
    end


    def won?
      WIN_COMBINATIONS.find do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] &&
      board.cells[combination[1]] == board.cells[combination[2]] &&
      (board.cells[combination[0]]== "X" || board.cells[combination[0]]== "O" )
      end
    end

    def over?
      won? || draw?
    end

    def draw?
      !won? && @board.full?
    end

    def winner
      if winning_combo = won?
        @board.cells[winning_combo.first]
      end
    end

    def turn
      player = current_player
      current_move = player.move(@board)

      if !@board.valid_move?(current_move)
        turn
      else
       @board.update(current_move, player)
       @board.display
       puts "#{player.token} moved to #{current_move}"
      end
    end

    def play

    end
    

end
