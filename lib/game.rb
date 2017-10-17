class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #First cross
    [2,4,6]  #Second cross
  ]

    def initialize(player_1=Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
      if @board.turn_count.even? == true
        return @player_1
      else
        return @player_2
      end
    end

    def full?
      @board.cells.all? {|i| i == "X" || i == "O" }
    end

    def won?
      top_row_win = WIN_COMBINATIONS[0]
      middle_row_win = WIN_COMBINATIONS[1]
      bottom_row_win = WIN_COMBINATIONS[2]
      first_column_win = WIN_COMBINATIONS[3]
      second_column_win = WIN_COMBINATIONS[4]
      third_column_win = WIN_COMBINATIONS[5]
      first_cross_win = WIN_COMBINATIONS[6]
      second_cross_win = WIN_COMBINATIONS[7]

      win_index_1 = top_row_win[0]
      win_index_2 = top_row_win[1]
      win_index_3 = top_row_win[2]
      win_index_4 = middle_row_win[0]
      win_index_5 = middle_row_win[1]
      win_index_6 = middle_row_win[2]
      win_index_7 = bottom_row_win[0]
      win_index_8 = bottom_row_win[1]
      win_index_9 = bottom_row_win[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      position_4 = @board.cells[win_index_4]
      position_5 = @board.cells[win_index_5]
      position_6 = @board.cells[win_index_6]
      position_7 = @board.cells[win_index_7]
      position_8 = @board.cells[win_index_8]
      position_9 = @board.cells[win_index_9]
  # X's win combo's
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return top_row_win
      elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
        return middle_row_win
      elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
        return bottom_row_win
      elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
        return first_column_win
      elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
        return second_column_win
      elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
        return third_column_win
      elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
        return first_cross_win
      elsif position_3 == "X" && position_5 == "X" && position_7 == "X"
        return second_cross_win
      end

  #O's win combo's
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return top_row_win
      elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
        return middle_row_win
      elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
        return bottom_row_win
      elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
        return first_column_win
      elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
        return second_column_win
      elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
        return third_column_win
      elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
        return first_cross_win
      elsif position_3 == "O" && position_5 == "O" && position_7 == "O"
        return second_cross_win
      end
  end

    def draw?
     if won? == nil
        if full?
       true
        end
     else
       false
     end
    end

    def over?
      if won? || draw?
         true
      else
         false
      end
    end

    def winner
      if won?
        @board.cells[won?.detect{|i| @board.cells[i] == "X" || @board.cells[i] == "O"}]
      end
    end

    def position_taken?(index)
      !(@board.cells[index].nil? || @board.cells[index] == " ")
    end

    def turn
        if self.current_player.class == Players::Human
          index = self.current_player.move(@board).to_i
          if @board.valid_move?(index) == true
            @board.update(index, self.current_player)
            @board.display
          else
            puts "invalid"
            self.turn
          end
        elsif self.current_player.class == Players::Computer
          index = self.current_player.move(@board).to_i
          if @board.valid_move?(index) == true
            sleep(1.2)
            @board.update(index, self.current_player)
            @board.display
          else
            self.turn
          end
        end
    end

    def play
      while over? != true do
        turn
      end
      if draw?
        puts "Cat's Game!"
      elsif self.winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    end

end
