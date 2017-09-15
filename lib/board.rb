require 'pry'

class Board

  attr_accessor :cells


  def initialize(board = nil)
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end



  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def position(input)
    @cells[input_to_index(input)]
  end

  def full?
    full_board = @cells.all? do |value|
      value == "X" || value == "O"
    end
    full_board
  end

  def reset!
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def turn_count
      @cells.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(index)
    return index.to_i - 1
  end

  def update(index, player)
    @cells[input_to_index(index)] = player.token
  end

  def taken?(index)
    @cells[input_to_index(index)] == "X" || @cells[input_to_index(index)] == "O"
  end


  def valid_move?(index)
    !taken?(index) && (input_to_index(index)).between?(0,8)
  end

  end
