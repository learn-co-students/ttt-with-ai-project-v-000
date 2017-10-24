class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #resets the board (cells array) to an empty board (array)
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #prints the board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  #takes in user input and returns the value of the board cells
  def position(user_input)
    @cells[(user_input.to_i - 1)]
  end

  #checks if the board id full and returns true or false
  def full?
    is_full = []
    @cells.each do |position|
      if position == " " || position == ""
        is_full << "false"
      end
    end
    if is_full.include?("false")
      return false
    else
      return true
    end
  end

  #returns the amount of turns based on cell values
  def turn_count
    count = 0
    @cells.each do |cell|
      if cell != " " && cell != ""
        count += 1
      end
    end
    count
  end

  #checks if the spot if taken. returns true if taken and false if available
  def taken?(input)
    if self.position(input) == "X" || self.position(input) == "O"
      return true
    elsif self.position(input) == " " || self.position(input) == ""
      return false
    end
  end

  #returns true for user input between 1-9 that is not taken
  def valid_move?(user_input)
    if user_input.to_i.between?(1, 9) && self.taken?(user_input) == false
      return true
    else
      return false
    end
  end

  #updates the cell chosen by player input with the player's token (X or O)
  def update(user_input, player_token)
    @cells[(user_input.to_i - 1)] = player_token.token
  end
end
