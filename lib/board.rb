class Board

  attr_accessor :cells

  def cells
    @cells
  end

  def reset!
    @cells= Array.new(9, " ")
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(move)
    cells[move.to_i-1]
  end

  def full?
    cells.all? { |value| value == "X" || value == "O" }
  end

  def turn_count
    turns_taken = 0
    cells.each do |occupied_position|
      if occupied_position == "X" || occupied_position == "O"
        turns_taken +=1
      end
    end
    turns_taken
  end

  def taken?(move)
    position(move) != " " && position(move) != ""
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move)
  end

  def update(move, player)
    position = move.to_i - 1
    cells[position] = player.token
  end




end
