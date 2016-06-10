
class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = create_cells
  end

  def create_cells
    ans = []
    9.times {ans << " "}
    ans
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(p)
    @cells[p.to_i - 1]
  end

  def full?
    cells.all? {|i| !(i.nil? || i == " ")}
  end

  def turn_count
    count = 0
    cells.each do |idx|
      if idx == "X" || idx == "O"
        count+=1
      end
    end
    count
  end

  def taken?(l)
    cells[l.to_i - 1] != " " && cells[l.to_i - 1] != ""
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(i, player)
    cells[i.to_i - 1] = player.token
  end


end




















