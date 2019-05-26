class Board

  attr_accessor :cells, :token, :WIN_COMBINATIONS

def initialize
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]



end

def reset!
@cells = []
@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

end


def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end



def position(user_output)

@cells[user_output.to_i - 1]




end

  def full?
    @cells.all? do |mark|

      if mark == "X" || mark == "O"
        true
      end
    end
  end

  def turn_count

    count = 0
      @cells.each do |move|
        if move == "X" || move == "O"
          count += 1
        end
      end
      count
    # cells.count{|token| token == "X" || token == "O"} 
  end

def taken?(user_output)
  if cells[user_output.to_i - 1] == " " || cells[user_output.to_i - 1] == "" ||  cells[user_output.to_i - 1] == nil
 return false
elsif cells[user_output.to_i - 1] == "X" || cells[user_output.to_i - 1] == "O"
 true


end
end

def valid_move?(user_output)

    user_output.to_i.between?(1,9) && !taken?(user_output)

end

def update(user_output, player)
  input = user_output.to_i - 1
  @cells[input] = player.token


end

def valid_moves
  ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select do |move|
    valid_move?(move)
  end

end
end
