require 'pry'

class Players::Computer

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  ALMOST_WIN_VALUES = [
    ["X", "X", " "],
    ["X", " ", "X"],
    [" ", "X", "X"],
    ["O", "O", " "],
    ["O", " ", "O"],
    [" ", "O", "O"],
  ]

  def move(array)
    best_move = " "
    temp_valid_array = array.valid_moves_array
    if almost_win_open?(array) == true
      best_move = almost_win_return(array).to_s
    elsif corner_open?(array) == true
      best_move = corner_return(array)
    elsif center_open?(array) == true
      best_move = "5"
    else
      best_move = temp_valid_array.sample.to_s
    end
    best_move
  end


  def almost_win_open?(array)
    WIN_COMBINATIONS.each { |x|
      temp_array = []
      temp_array << array.cells[x[0]]
      temp_array << array.cells[x[1]]
      temp_array << array.cells[x[2]]
      if ALMOST_WIN_VALUES.include?(temp_array)
        return true
      end
    }
  end

  def almost_win_return(array)
    open_spot = " "
    WIN_COMBINATIONS.each { |x|
      temp_array = []
      temp_array << array.cells[x[0]]
      temp_array << array.cells[x[1]]
      temp_array << array.cells[x[2]]
      if ALMOST_WIN_VALUES.include?(temp_array)
        if temp_array[0] == " "
          open_spot = x[0] + 1
        elsif temp_array[1] == " "
          open_spot = x[1] + 1
        elsif temp_array[2] == " "
          open_spot = x[2] + 1
        end
      end
    }
    open_spot.to_s
  end


  def center_open?(array)
    array.cells[4] == " "
  end


  def corner_open?(array)
    temp_array = []
    i = 0
    until i > 8
      if array.cells[i] == " " && [0,2,6,8].include?(i) == true
        temp_array << i
      end
      i += 1
    end
    temp_array.size > 0
  end

  def corner_return(array)
    temp_array = []
    i = 0
    until i > 8
      if array.cells[i] == " " && [0,2,6,8].include?(i) == true
        temp_array << i
      end
      i += 1
    end
    temp_return = temp_array.sample + 1
    temp_return.to_s
  end

end
