class Board

  attr_accessor :cells

  def initialize
    @cells= Array.new(9, " ")
  end

  def reset!
    self.cells.clear
    self.cells= Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
  @cells.all? do |index|
    index == "X" || index == "O"
    end
  end

  def turn_count
    counter= 0
    @cells.each do |count|
      if count == "X" || count == "O"
      counter +=1
      end
    end
  counter
  end

  def taken?(user_input)
    !(position(user_input) == " "|| position(user_input)== "")
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(user_input, player)
    @cells[user_input.to_i-1] = player.token
  end




end
