class Board
  attr_accessor :cells

  def initialize
    @cells = []
    9.times {@cells << " "}

  end

  def reset!
    cells.clear
    9.times {@cells << " "}
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    !cells.any?{|x| x==" "}
  end

  def turn_count
    cells.count{|x| x=="X" or x=="O"}
  end

  def taken?(input)
    !(cells[input.to_i - 1] == " ")
  end

  def valid_move?(input)
    move = input.to_i
    move.between?(1,9) && cells[move-1] == " "
  end

  def update(move,player)
    cells[(move.to_i) -1] = player.token
  end
end
