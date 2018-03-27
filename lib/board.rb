require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end


  def display
      puts " #{@cells [0]} | #{@cells [1]} | #{@cells [2]} "
      puts "-----------"
      puts " #{@cells [3]} | #{@cells [4]} | #{@cells [5]} "
      puts "-----------"
      puts " #{@cells [6]} | #{@cells [7]} | #{@cells [8]} "
  end

  def position(input)
    board_position = input.to_i - 1
    @cells[board_position]
  end

  def full?
    @cells.none? do |check|
      if check == " "
        true
      end
    end
  end

  def turn_count
    counter = 0
    @cells.each do |move|
      if move == "X" || move == "O"
        counter += 1
        end
      end
      counter
    end

    def taken?(input)
      index = input.to_i - 1
      if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
        false
      elsif @cells[index] == "X" || @cells[index] == "O"
        true
      end
    end

    def valid_move?(input)
      index = input.to_i - 1
      if taken?(input) == false && index.between?(0,8)
        true
      end
    end

    def update 
    end


end
