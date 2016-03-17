require 'pry'


class Board

  attr_accessor :cells, :token, :move, :player

 

    def initialize
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end



    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
      puts " ----------- "
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts " ----------- "
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts " -----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
      move = input.to_i
      move -= 1
      @cells[move]
    end

    def full?
      true if !@cells.detect {|x| x == " "}
    end



    def turn_count
      counter = 0
      @cells.each do |x|
        if x == "X" || x == "O"
          counter +=1
        end
      end
      return counter
    end

    def taken?(input)
      position(input) != " " ? true : false
    end

    def valid_move?(input)

      valid_numbers = ["1","2","3","4","5","6","7","8","9"]
      if taken?(input) == false && valid_numbers.include?(input)
        true
      else
        false
      end
    end

    def update(input, player)
      move = input.to_i
      move -= 1


      if valid_move?(input)
        @cells[move]=player.token
      end

      return @cells
     
    end




end