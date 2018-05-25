class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]
   ]

   def initialize(player_one = Players::Human.new("X"), player_two = Players::Human.new("O"), new_board = Board.new)
     @player_1 = player_one
     @player_2 = player_two
     @board = new_board
   end

  def turn_count
    count = 0
    @board.cells.each do |letter|
      if letter == "X" || letter == "O"
        count += 1
      else
        count += 0
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? @player_1 : @player_2
  end

   def won?
     board_test = @board.cells.all? {|letter| letter == " "}
     if board_test
       return false
     else
       WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = @board.cells[win_index_1]
         position_2 = @board.cells[win_index_2]
         position_3 = @board.cells[win_index_3]

         if position_1 == "X" && position_2 == "X" && position_3 == "X"
           return win_combination
         elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
           return win_combination
         end
       end
       return false
     end
   end

   def full?
    full_board = 0
    @board.cells.each do |letter|
      if letter == "X" || letter == "O"
        full_board += 1
      else
        full_board += 0
      end
    end
    if full_board == 9
      return true
    else
      return false
    end
  end

   def draw?
    if full?
      if !won?
        return true
      end
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      board_index = won?[0]
      if @board.cells[board_index] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def turn
    selection = current_player.move(@board)
    player_choice = selection.to_i
    if @board.valid_move?(player_choice)
      @board.update(player_choice, current_player)
    else
      selection = current_player.move(@board)
    end
  end


  def play
    until over? || full?
      @board.display
      turn
    end

    if winner == "X"
      @board.display
      puts "Congratulations X!"
    elsif winner == "O"
      @board.display
      puts "Congratulations O!"
    else
      @board.display
      puts "Cat's Game!"
    end
  end

end
