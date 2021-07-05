require 'pry'
class Board 
  
  attr_accessor :cells
    
    @cells = []
    
    def initialize 
      reset!
    end 
    
    def reset! 
      @cells = Array.new(9, " ")
    end
    
    def display 
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end
    
    def position(input) 
      new_input = input.to_i - 1
      @cells[new_input]
      end
      
    def full? 
      if !@cells.include?(" ")
        true
      end
    end 
  
    def turn_count 
      count = 0 
      @cells.each do |cell|
        if cell == "X" || cell == "O" 
          count += 1 
        end
      end
      count
    end
    
    def taken?(input) 
      new_input = input.to_i - 1
      if @cells[new_input] == "X" || @cells[new_input] == "O"
        true
      else
        false
      end
    end
    
    def valid_move?(input)
      new_input = input.to_i 
      if (1..9).include?(new_input) && taken?(input) == false
        true 
      else 
        puts "That is not a valid move."
      end
    end
    
    def update(input, player)
      new_input = input.to_i - 1 
      @cells[new_input] = player.token
    end
      
end