class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end


  def full?
    @cells.all? do |space|
      if space == " "
        false
      else
        true
      end
    end
  end


  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end



    def position(num)
      new_num = num.to_i - 1
      cells[new_num]
    end

    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
  !(position(index) == ''|| position(index) == " ")
  end

  def update(position,player)
    new_position = position.to_i - 1
    cells[new_position] = player.token
  end

















end
