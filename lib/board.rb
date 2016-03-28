require 'pry'

class Board
  attr_accessor :cells
   
    def initialize
      @cells=[]
      reset!
    end

    def reset!
     self.cells = Array.new(9, " ")
    end

    def display
      puts " "
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-------------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-------------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
      puts " "
      puts " "
    end

    def position(input)
      cel_num= input.to_i - 1
      cells[cel_num]
    end

    def full?
      !cells.include?(" ")
    end
  

    def turn_count
      cells.count {|space| space=="X" || space=="O"}
    end

    def taken?(input)
      position(input)=="X" || position(input)=="O"
    end

    def valid_move?(input)
      input.to_i.between?(1,9) && taken?(input)==false
    end

    def update(input,player)
      cells[input.to_i - 1]= player.token
    end
end