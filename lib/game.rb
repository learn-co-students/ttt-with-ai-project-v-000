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

   def current_player
     counter = 0
     @board.cells.each do |letter|
       if letter == "X" || letter == "O"
         counter += 1
       end
     end
     if counter % 2 == 0
       Player.new("X")
     else
       Player.new("O")
     end
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

  # def turn
  #   if @board.turn_count % 2 == 0
  #     selection = @player_1.move(@board)
  #     if !@board.valid_move?(selection)
  #       @player_1.move(selection)
  #     else
  #       @board.update(selection, @player_1)
  #     end
  #   elsif @board.turn_count % 2 != 0
  #     selection_two = @player_2.move(@board)
  #   end
  # end

  def turn
    current = current_player
    if current_player.token == "X"
      selection = @player_1.move(@board)
      choice = selection.to_i
      if @board.valid_move?(choice)
        @board.update(selection, @player_1)
        binding.pry
      else
        @player_1.move(@board)
      end
    elsif current_player.token == "O"
      selection_two = @player_2.move(@board)
      choice_two = selection.to_i
      if @board.valid_move?(choice_two)
        @board.update(selection_two, @player_2)
      else
        @player_2.move(@board)
      end
    end
  end

  def play
    until over? || full?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
