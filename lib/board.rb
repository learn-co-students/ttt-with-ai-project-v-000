class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    position = (user_input.to_i)-1
    cells[position]
  end 

  def full?
    cells.all? {|position| position == "X" || position == "O"}
  end

  def turn_count
    counter = 0
      cells.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    position = (user_input.to_i)-1
    (cells[position] != " " && cells[position] != "" && cells[position] != nil)
  end

  def valid_move?(user_input)
    position = user_input.to_i - 1
    position.between?(0, 8) && !taken?(user_input)
  end

  def update(user_input, player)
      cells[user_input.to_i - 1] = player.token
  end


  end
