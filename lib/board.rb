require 'pry'

class Board

  attr_accessor :cells


  def reset!
    cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end


  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_input) #takes in user input in the form of a 1-9 string
      position = @cells[user_input.to_i - 1]
      position
    end

    def full?
      @cells.all? do |token|
      token == "X" || token == "O"
      end
    end

    def turn_count
      @cells.count{|token| token == "X" || token == "O"}
    end

    def taken?(input)
      user_input = input.to_i - 1
       cells[user_input] == "X" || cells[user_input] == "O"
    end

    def valid_move?(input)
      i = input.to_i
      (1...cells.length).include? (i) && !taken?(input)
    end
end
