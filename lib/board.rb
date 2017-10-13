require 'pry'
class Board
  # Is this saving

  attr_accessor :cells

  def initialize(cells = Array.new(9," "))
    @cells = cells

  end

  def reset!
    cells.clear
    9.times do
      cells << " "
    end
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    user_input = user_input.to_i
    cells[user_input-1]
  end

  def full?
    cells.all?{|cell| cell != " "}
  end

  def turn_count
    counter = 0
    if self.full? == false
      cells.each{|cell| counter += 1 if cell != " "}
      counter
    end
  end

  def taken?(user_input)
    user_input = user_input.to_i
    cells[user_input-1] == "X" || cells[user_input-1] == "O"
  end

  def valid_move?(user_input)
    user_input = user_input.to_i
    !full? && !taken?(user_input) if user_input >= 1 && user_input < 10
  end

  def update(user_input,player)
    user_input = user_input.to_i

    cells[user_input-1] = player.token

    # binding.pry
    #look this over as player is not being used

  end


end
