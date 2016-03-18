require 'pry'

class Player::Computer < Player

  attr_accessor :board, :cells
  attr_reader :token

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def move(board)
    
    token = self.token

    corners = [0,2,6,8]


    puts "What is your move Player #{token}?"
    turn = board.turn_count
    if turn == 0
      move = "1"
      return move 
    elsif turn == 1
      if board.cells[4] == "X"
        move = "1"
        return move
      else
        move = "5"
        return move
      end
    elsif turn == 2
      if board.cells[4] != "O"
        move = "5"
        return move
      elsif board.cells[4] == "O"
        move = "7"
        return move
      end


    elsif turn == 3
      if board.cells[4] == "O"
        if block(board) != nil
          move = block(board)
          move +=1
          move = move.to_s

          return move
        else
          corners.each do |x|
            if board.cells[x] == " "
              move = x + 1
              
              move = move.to_s
              return move
            end
          end
        end
        
      
      elsif board.cells[4] == "X"
          move = block(board)
          move +=1
          move = move.to_s
          return move
      end   

    elsif turn >=4
      if token == "O"
        if win(board) != nil
            move = win(board)
            move +=1
            move = move.to_s
            return move
        elsif block(board) != nil
            move = block(board)
            move +=1 
            move = move.to_s
            return move
        else
          move = rand(9).to_s
          return move
        end
      elsif token == "X"
        if win1(board) != nil
            move = win1(board)
            move +=1
            move = move.to_s
            return move
        elsif block1(board) != nil
            move = block1(board)
            move +=1 
            move = move.to_s
            return move
        else
          move = rand(9).to_s
          return move
        end
      end
      
     
  

    end

  end

  #returns an array of WIN_COMBINATIONS  but with the actual letters. 
  #In the next step, I will 

  def board_combos(board)
    big_array = []
    Computer::WIN_COMBINATIONS.each do |combo|
      small_array = []
      combo.collect do |x|
        
        
        small_array<<board.cells[x]
      end
      big_array<<small_array
    end
    big_array
  end

  #takes array from board_combos and finds the specific array within that array that has the winning combo.
  def win_index(board)
    move = nil

    letter_array = board_combos(board)
    letter_array.each do |combo|
      if combo.count("O") == 2 && combo.include?(" ")
        move = letter_array.index(combo)
      end
    end
    move
  end

  #takes the specific array within the combo array and finds the position of the winning spot

  def win_position(board)
    win_number = win_index(board)
    letter_array = board_combos(board)
    letter_array[win_number].each do |x|
      if x == " "
        return letter_array[win_number].index(x)
      end
    end
  end

  #finds that winning spot within the win_combinations array and returns the appropriate move number
  def win(board)
    win_array = win_index(board)
    if win_array == nil
      nil
    else
      win_spot = win_position(board)
      move = Computer::WIN_COMBINATIONS[win_array][win_spot]
      move
    end
  end

  def block_index(board)
    move = nil
    block_array = board_combos(board)
    block_array.each do |combo|
      if combo.count("X") == 2 && combo.include?(" ")
        
        move = block_array.index(combo)

      end
    end
    move
  end


  #takes the specific array within the combo array and finds the position of the winning spot

  def block_position(board)
    block_number = block_index(board)
    block_array = board_combos(board)
    block_array[block_number].each do |x|
      if x == " "
        return block_array[block_number].index(x)
      end
    end
  end

  #finds that winning spot within the win_combinations array and returns the appropriate move number
  def block(board)
    block_array = block_index(board)
    if block_array == nil
      nil
    else
      block_spot = block_position(board)
      
      move = Computer::WIN_COMBINATIONS[block_array][block_spot]
      move
    end
  end

#######################################################################

#takes array from board_combos and finds the specific array within that array that has the winning combo.
  def win_index1(board)
    move = nil
    letter_array = board_combos(board)
    letter_array.each do |combo|
      if combo.count("X") == 2 && combo.include?(" ")
        move = letter_array.index(combo)
      end
    end
    move
  end

  #takes the specific array within the combo array and finds the position of the winning spot

  def win_position1(board)
    win_number = win_index1(board)
    letter_array = board_combos(board)
    letter_array[win_number].each do |x|
      if x == " "
        return letter_array[win_number].index(x)
      end
    end
  end

  #finds that winning spot within the win_combinations array and returns the appropriate move number
  def win1(board)
    win_array = win_index1(board)
    if win_array == nil
      nil
    else
      win_spot = win_position1(board)
      move = Computer::WIN_COMBINATIONS[win_array][win_spot]
      move
    end
  end

  def block_index1(board)
    move = nil
    block_array = board_combos(board)
    block_array.each do |combo|
      if combo.count("O") == 2 && combo.include?(" ")
        
        move = block_array.index(combo)
      end
    end
    move
  end


  #takes the specific array within the combo array and finds the position of the winning spot

  def block_position1(board)
    block_number = block_index1(board)
    block_array = board_combos(board)
    block_array[block_number].each do |x|
      if x == " "
        return block_array[block_number].index(x)
      end
    end
  end

  #finds that winning spot within the win_combinations array and returns the appropriate move number
  def block1(board)
    block_array = block_index1(board)
    if block_array == nil
      nil
    else
      block_spot = block_position1(board)
      
      move = Computer::WIN_COMBINATIONS[block_array][block_spot]
      move
    end
  end
end


        

      
  



