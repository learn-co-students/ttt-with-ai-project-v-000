class Board   #attributes externally visible
  attr_accessor :cells

  #resets to empty array
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display(cells= @cells)
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #takes in index and returns value
  def position(location)
    @cells[location.to_i - 1]
  end

  #returns true if board entirely occupied with X or O
  def full?(cells = @cells)
    cells.all?{|taken| taken == "X" || taken == "O"}
  end

  #returns turn count based on how many positions in cell array are filled
  def turn_count(cells = @cells)
    cells.count {|taken| taken == "X" || taken == "O"}
  end

  #takes in index and returns true if value is X or O
  def taken?(cells = @cells, location)
    @cells[location.to_i - 1] == "X" || @cells[location.to_i - 1] == "O"
  end

  #takes in user input 1-9 and returns true if not taken. entering space number not index
  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

  #takes in index and player object(X,O) and call taken method on the player
  def update(location, player)
    cells[location.to_i - 1] = player.token
  end
end
