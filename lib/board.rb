class Board

  attr_accessor :cells

  def initialize #should start w/ cells for a new game of TTT can should use #reset!
    reset!
  end

  def reset! #resets the state of cells to what a board should look like at the start of the game
     #@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]#an array with 9 " " elements
     @cells = Array.new(9, " ")
  end

  def display #board can print its current state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "-----------"
  end

  def position(cell) #takes in user's input (1-9 strings like "2" or "9") looks up value of cells at correct index
    @cells[cell.to_i - 1]
  end

  def full?
    @cells.all? { |cell| cell != " "}
  end

  def turn_count
    @cells.count {|turn| turn == "X" || turn == "O"}
  end

  def taken?(cell)
    !(position(cell).nil? || position(cell) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update (input, player)#represents updating board when a player makes a move. # takes 2 args
    if valid_move?(input)# 1st arg- position iser wants to occupy in the form of 1-9 strings read lab instructions
      input = input.to_i - 1
      cells[input] = player.token
    end
  end

  def cells
    @cells
  end



end
