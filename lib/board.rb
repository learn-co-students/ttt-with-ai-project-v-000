require 'pry'

class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    print " #{@cells[0]} |"
    print " #{@cells[1]} |"
    puts " #{@cells[2]} "
    puts "-----------"
    print " #{@cells[3]} |"
    print " #{@cells[4]} |" 
    puts " #{@cells[5]} "
    puts "-----------"
    print " #{@cells[6]} |"
    print " #{@cells[7]} |"
    puts " #{@cells[8]} "
  end

  def current_player
    @board.turn_count % 2 == 0? "X" : "O"
  end

  def i_to_i(input)
    return input.to_i - 1
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?()
    @cells.each do |index|
      if index != "X" && index != "O"
        return false
      end
    end
    return true
  end

  def won?
    WIN_COMBINATIONS.each do |comb|
      if @cells[comb[0]] == "X" && @cells[comb[1]] == "X" && @cells[comb[2]] == "X"
        @win_combo = comb
        return true
      end
      if @cells[comb[0]] == "O" && @cells[comb[1]] == "O" && @cells[comb[2]] == "O"
        @win_combo = comb
        return true
      end
    end
    return false
  end

  def draw?
    if !(won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @cells[@win_combo[0]]
    else
      return nil
    end
  end



  def turn_count()
    count = 0
    @cells.each do |i|
      if (i == "X" || i == "O")
        count += 1
      end
    end
    return count
  end

  def taken?(input)
    return !(@cells[i_to_i(input)].nil? || @cells[i_to_i(input)] == " ")
  end

  def valid_move?(input)
    if i_to_i(input) >= 0 && i_to_i(input) <= 8 && !(taken?(input))
      return true
    else
      return false
    end
  end

  def update(input, player)
    @cells[i_to_i(input)] = player.token
  end

end