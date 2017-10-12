class Board
  attr_accessor :cells, :display, :position,   :turn_count,   :update
  def initialize
    @cells = Array.new(9, " ")      #has an attribute to store the cells of the board
  end

  def reset!                      #can reset the state of the cells in the board
    @cells = Array.new(9, " ")    #sets the cells of the board to a 9 element array of " "
  end

  def display   #prints the board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(board_cell)                #takes in user input and returns the value of the board cell
      board_cell = board_cell.to_i-1
      @cells[board_cell]
  end

  def full?    #returns true for a full board, returns false for an in-progress game
    if @cells.any? {|cell| cell == " "}
      false
    else
      true
    end
  end

  # def full?(board)
  #   board.all?{|token| token == "X" || token == "O"}
  # end
  # def full?
  #   !cells.include?(" ")
  # end

  def turn_count  #returns the amount of turns based on cell value
    @cells.count {|turn| turn == "X" || turn == "O"}
  end

  def taken?(board_cell)  #returns true if the position is X or O
    if position(board_cell)  == "X" || position(board_cell)  == "O"
      true
    else
      false
    end
  end

  def valid_move?(board_cell)         #returns true for user input between 1-9 that is not taken
    if board_cell.to_i.between?(1, 9) && taken?(board_cell) == false
      true
    else
      false
    end
  end

  def update(board_cell, player)      #updates the cells in the board with the player token according to the input
    if valid_move?(board_cell) == true
      board_cell = board_cell.to_i-1
      cells[board_cell] = player.token
    end
  end

end


# => rspec --f-f
