require 'pry'
class Board
  #git status
  #git add .
  #git commit -m "message"
  #git push
  #https://itzsaga.github.io/post/one-way-to-pair-program/

  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end


  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    turn_number = self.cells.select {|cell| cell == "X" || cell == "O"}
    turn_number.count
  end

  def taken?(position)
    index = position.to_i - 1
    if cells[index] == "X" || cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !taken?(position)
  end

  def update(position, player)
    index = position.to_i - 1 #update expects a string. removed - 1 due to error creating [-1] input
    cells[index] = player.token #and a player.
  end
end
