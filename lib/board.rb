require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    token = @cells[input.to_i-1]
    # puts "#{token}"
    token
  end

  def full?
    @cells.none? {|position| position == " "}
  end

  def turn_count
    counting = 0
    @cells.each do |position|
      if position == "X" || position == "O"
        counting += 1
      end
    end
    counting
  end

  def taken?(input)
    position = input.to_i-1
    if @cells[position] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    post = input.to_i
    if taken?(input) == false
      if post > 0 && post < 10
        true
      end
    end
  end

    def update(position, player)
      index = position.to_i-1
      @cells[index] = player.token
    end

end
