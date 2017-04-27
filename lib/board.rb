class Board
    attr_accessor :cells
    def initialize
        reset!
    end
    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end
    def position(user_input)
      cells[user_input.to_i-1]
    end
    def taken?(user_input)
      position(user_input) != " "
    end
    def valid_move?(user_input)
      user_input_to_i = user_input.to_i
      user_input_to_i <= 9 && user_input_to_i >= 1 && !taken?(user_input_to_i)
    end
    def update(user_input, player)
      cells[user_input.to_i-1]=player.token if !taken?(user_input) && valid_move?(user_input)
    end
    def full?
      !cells.include?(" ")
    end
    def turn_count
      cells.select{|cell| cell != " "}.count
    end
    def reset!
        @cells=Array.new(9," ")
    end
end
