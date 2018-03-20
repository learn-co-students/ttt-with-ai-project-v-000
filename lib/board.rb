require 'pry'
class Board
  attr_accessor :cells

  def initialize
      reset!
    end

  def self.cells
    @cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.none? {|n| n == ' '}
  end

  def turn_count
    n = 0
    @cells.each do |i|
      if i != ' '
        n += 1
      end
    end
    n
  end

  def taken?(position)
    @cells[position.to_i - 1] != ' '
  end

  def valid_move?(position)
    position(position) == " " && position.to_i.between?(1,9) && !taken?(position) && position != "invalid"
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token


  end


  def token
    @cells.count % 2 == 0 ? "O" : "X"
  end





end
