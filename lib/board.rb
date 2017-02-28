class Board

  attr_accessor :cells #has an attribute to store the cells of the board

  def initialize #sets the cells of the board to a 9 element array of " "
    @cells = Array.new(9," ")
  end

  def reset! #can reset the state of the cells in the board; sets the cells of the board to a 9 element array of " "
    self.cells.clear
    @cells = Array.new(9," ")
  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def index(position) #converts the user's inputted position into its corresponding index within @cells
    position.to_i - 1
  end

  def position(position) #takes in user input and returns the value of the board cell'
    @cells[index(position)]
  end

  def full? #returns true for a full board; returns false for an in-progress game
    @cells.each do |cell|
      if (cell != "X") && (cell !="O")
        return false
      end
    end
    true
  end

  def turn_count #eturns the amount of turns based on cell value
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(position) #returns true if the position is X or O
    if @cells[index(position)] == "X" || @cells[index(position)] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position) #returns true for user input between 1-9 that is not taken
    if (1..9) === position.to_i && @cells[index(position)] == " "
      true
    else
      false
    end
  end

  def update(position,player) #updates the cells in the board with the player token according to the input
    @cells[index(position)] = player.token
  end
end
