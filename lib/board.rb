class Board
  attr_accessor :cells
  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
  end

  def display  #Puts the existing board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def reset!  # Removes all exising elements from the @cells array
    self.cells = Array.new(9, " ")
  end

  def position(index) #  Returns the current value (" ", "X", "O") at the index given
    self.cells[index.to_i - 1]
  end

  # def input_to_index(user_input)  #  Converts the input to an integer and then to array index
  #   index = (user_input.to_i) - 1
  # end

  def full?  # Return false if any of the cells are empty
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count  #  Returns number of cells that are not empty
    self.cells.select{|c| !c.lstrip.empty?}.count
  end

  def taken?(input) # Converts input to index via method and returns boolean in index is occupied with X or O
    index = (input.to_i)-1
    self.cells[index] == " " ? false : true
  end

  # def open_spaces
  #   self.cells.select do |c|
  #     c if self.position(c) == " "
  #   end
  # end

  def valid_move?(input) # Returns boolean for cell not taken and input is within range of existing array elements
    !taken?(input) && (1..9).member?(input.to_i)
  end

  def update(input, player)  # Sets array index equal to current player token
    # binding.pry
    self.cells[input.to_i-1] = player.token
  end


end # End of Class
