class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")

  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")

  end
  #binding.pry
  def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end
    #binding.pry
    def position(i)
      user_input = i.to_i-1
      self.cells[user_input]
    end

    def full?

      self.cells.all? {|values| values =="X" || values == "O"}

    end

    def turn_count
      self.cells.count{ |values| values != " "}
    end

    def taken?(num)
      if self.position(num) == "X" || self.position(num) == "O"
        true
      else
        false
      end
    end

    def valid_move?(num)
      !self.taken?(num) && (num).to_i.between?(1,9)

    end

    def update (position,player)
      self.cells[position.to_i - 1] = player.token

    end 

end
