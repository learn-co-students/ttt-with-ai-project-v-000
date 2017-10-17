class Board

  attr_accessor :cells, :board
  @@all = []

  def reset!
    @@all.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    # input = gets.strip
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.all? do |element|
      element == "X" || element == "O"
    end
  end

  def turn_count
    cells.count{|t| t == "X" || t == "O"}
  end

  def taken?(input)
    # if position(input) == "X" || "O"
  !(position(input) == " " || position(input) == "")
    #     cells[index] != " " && cells[index] != ""
  #   if board[index] == " "
  #     false
  #   elsif board[index] == ""
  #     false
  #   elsif board[index] == nil
  #     false
  #   else board == "X" || "O"
  #     true
  # end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, obj = "X")
      cells[input.to_i - 1] = obj.token
  end

end
