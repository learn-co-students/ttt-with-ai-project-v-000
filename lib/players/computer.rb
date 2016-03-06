class Player::Computer < Player
  #@opponent_token = @token

  def move(board)
  # method goals:
  # to make conditional statements based on different cases
  # need to put them in the order i want them to loop in
  # will go first to option one, if not true, then next, etc.
    if board.turn_count == 0
      play_corner(board) 
    elsif board.turn_count == 1 && !board.taken?(5)
      play_middle(board)
    elsif potential_win?(board)
      win_move.to_s #needed to convert position int to string - little redundant here bc my position method converts the string back into an int.
      #need to refactor all the instances where strings are converted to int and make sure that i convert the gets input from user to an int
    elsif potential_loss?(board) 
      block_move.to_s #same as above
    else
      random_move(board)
    end
  end

  def play_corner(board)
    position = ["1", "3", "7", "9"].sample #if board.turn_count == 0
    #should make this into an array of int when refactoring
  end

  def play_middle(board)
    "5" #if !board.taken?(5) #&& board.turn_count == 1
    #had to move if !board.taken?(5) to the if statement bc otherwise, it would go into an infinite loop
  end

  #def opponent_token
    #self.token == "X" ? "O" : "X"
  #end

  def random_move(board)
    moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] #should make this into an array of int when refactoring
    moves.sample
  end

  def potential_loss?(board)
  # method goals:
    # manipulate #potential_win?(board) to return a true/false boolean
    # if the boolean returns false, reset @count = 0
    # the boolean only returns true if @count == 2
      # @counter will increment up based on whether or not an opponent's token occupies the given space in combo. ex: ["X", "X", " "] #=> @count = 2

  @count = 0 

  @potential_loss_array = [] #should return array of cell values. ex: ["X", "X", " "]

  @combo_actual_position = [] #should return an array of the position combo within WIN_COMBINATIONS that renders the boolean 'true'. ex: [0, 4, 8]

    Game::WIN_COMBINATIONS.each do |combo| #outermost loop
    #try #any? bc it returns boolean, and i wouldn't have to explicitly return true/false
      #combo[0] => [0,1,2]
      #combo[1] => [3,4,5]
      #etc., etc.
      if @potential_loss_array.empty? # middle loop
        # tried to iterarte combo down even further, but it didn't work.
        # ex.: combo.each do {|num| count += 1 if board.cells[num] != " " && board.cells[num] != token}
        # do not understand why this did not work
        # below is innermost loop
        @count += 1 if board.cells[combo[0]] != " " && board.cells[combo[
          0]]!= token
        @count += 1 if board.cells[combo[1]] != " " && board.cells[combo[1]]!= token
        @count += 1 if board.cells[combo[2]] != " " && board.cells[combo[2]]!= token
      end

      #below is middle loop
      if @count == 2 && combo.any? {|position| !board.taken?(position + 1)}
        @combo_actual_position = combo #ex: combo => [0,1,2]
        @combo_actual_position.map {|x| @potential_loss_array << board.cells[x]}
        # pushing the value of board.cells [0=>"X", 1=>"X", 2=>" "] into @potential_loss_array
        # #map will return an array of new elements
        # ex: @potential_loss_array = ["X", "X", " "]
        return true
      else
        @count = 0
      end 
    end
    return false
  end

  def block_move
    #this would be the blocking move
    #this method needs to return a position (1..9) NOT an index (0..2) or the cell value ("X" || "O" || " ")

    @potential_loss_array.each_with_index do |position, i|
      #puts "i want to know what i is: #{i}"
      #puts "i want to know what position is: #{position}"
      #puts "i want to know what i is: #{i}" #i want to find what the position index is at each iteration
      return @combo_actual_position[i]+1 if position == " "

    end
  end

def potential_win?(board)
  #manipulate #potential_win?(board) to return a true/false boolean
  #if the boolean returns false, reset @count = 0

  @count = 0
  @potential_win_array = []
  @combo_actual_position = []

    Game::WIN_COMBINATIONS.each do |combo| #try #any?
      if @potential_win_array.empty?
        #combo[0] => [0,1,2]
        #combo[1] => [3,4,5]
        #etc., etc.
        @count += 1 if board.cells[combo[0]] != " " && board.cells[combo[
          0]]== token
        @count += 1 if board.cells[combo[1]] != " " && board.cells[combo[1]]== token
        @count += 1 if board.cells[combo[2]] != " " && board.cells[combo[2]]== token
      end
      if @count == 2 && combo.any? {|position| !board.taken?(position + 1)}
        @combo_actual_position = combo #combo => [0,1,2]
        @combo_actual_position.map {|x| @potential_win_array << board.cells[x]}
        #puts "This is the potential winning array: #{@potential_win_array}"
        #=> This is the potential winning array: ["X", "X", " "]
        #puts "This is the combo_actual_position: #{@combo_actual_position}"
        #=> This is the combo_actual_position: [0, 4, 8]
        return true
      else
        @count = 0
      end    
    end
    return false
  end

  def win_move
      #this would be the winning move
      #this method needs to return a position (1..9) NOT an index (0..2) or the cell value ("X" || "O" || " ")

    @potential_win_array.each_with_index do |position, i|
      #puts "i want to know what i is: #{i}"
      #puts "i want to know what position is: #{position}"
      #puts "i want to know what i is: #{i}" #i want to find what the position index is at each iteration
      return @combo_actual_position[i]+1 if position == " "
    end
  end

end