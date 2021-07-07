class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]}    "
   puts "----------- "
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]}    "
   puts "----------- "
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]}    "
  end

  def position(user_input)
    @cells[user_input.to_i-1]
  end

  def full?
    unless @cells.include?(" ")
      true
    end
  end

  def turn_count
    turns_taken = 9 - @cells.count(" ")
  end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input) ? true : false
  end

  def update(user_input, player)
    @cells[user_input.to_i-1] = player.token #swap this out for the player token once it's built
  end



end
