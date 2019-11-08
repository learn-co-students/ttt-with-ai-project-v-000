class Board
  attr_accessor :cells

  def initialize
      reset!
  end

  def reset!
      @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
       @cells.all? {|space| space != " "}
  end

  def turn_count
    counter = 0
    @cells.each do | current_player |
    if current_player == "X" || current_player == "O"
       counter += 1
      end
    end
     counter
   end

   def taken?(index)
      !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
   end

   def valid_move?(index)
     new_index = index.to_i - 1
     new_index.between?(0,8) && !taken?(index)
   end

   def update(index, player)
       @cells[index.to_i - 1] = player.token
   end
end
