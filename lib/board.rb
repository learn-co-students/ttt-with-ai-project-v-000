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
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end
    def position(user_input)
      user_input = user_input.to_i - 1
      cells[user_input]
    end
    def full?
      cells.all?{|space| space == "X" || space == "O"}
    end
    def turn_count
      counter = 0
      cells.each do |player|
        if player == "X" || player == "O"
          counter += 1
        end
      end
      counter
    end


    def taken?(user_input)
      if self.position(user_input) == " " || self.position(user_input) == "" || self.position(user_input) == nil
        false
      else
        self.position(user_input) == "X" || "O"
        true
      end
    end

    def valid_move?(user_input)
      true if (user_input.to_i - 1).between?(0, 8) && self.taken?(user_input) == false
    end

    def update(user_input, player)
      if self.taken?(user_input) == false && self.valid_move?(user_input) == true
        cells[user_input.to_i - 1] = player.token
      end
    end



end
