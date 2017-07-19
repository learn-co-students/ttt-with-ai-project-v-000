require "pry"

module Players
  class Computer < Player
    @@corners = ["1", "3", "7", "9"]
    @@sides = ["2", "4", "6", "8"]

    def self.corners
      @@corners
    end

    def self.sides
      @@sides
    end

    def move(board)
      #returns the move the computer wants to make as 1-9 string
      puts "Computer's move"
      position = ""

      if check_win_combos(board) != ""
        position = check_win_combos(board)
      elsif board.valid_move?("5")
        position = "5"
      elsif corners_available(board)
        if check_corners(board) != ""
          position = check_corners(board)
        elsif check_corners(board) == ""
          until board.valid_move?(position)
            index = rand(0..3)
            position = self.class.corners[index]
          end
        end
      else
        until board.valid_move?(position)
          index = rand(0..3)
          position = self.class.sides[index]
        end
      end
      sleep(0.2)
      position
    end

    def check_corners(board)
      position = ""
      self.class.corners.each.with_index do |corner, i|
        if board.taken?(corner) && board.position(corner) != self.token
          if i == 0
            position = self.class.corners[3] if board.valid_move?(self.class.corners[3])
          else
            position = self.class.corners[i - 1] if board.valid_move?(self.class.corners[i -1])
          end
        end
      end
      position
    end

    def corners_available(board)
      self.class.corners.any? {|corner| board.position(corner) == " "}
    end

    def check_win_combos(board)
      position = ""
      Game::WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = index_to_position(win_index_3)
        position_2 = index_to_position(win_index_2)
        position_3 = index_to_position(win_index_1)

        if compare_positions(board, position_1, position_2) == true
          position = position_3 if board.valid_move?(position_3)
        elsif compare_positions(board, position_1, position_3) == true
          position = position_2 if board.valid_move?(position_2)
        elsif compare_positions(board, position_2, position_3) == true
          position = position_1 if board.valid_move?(position_1)
        end
      end
      position
    end

    def index_to_position(index)
      (index + 1).to_s
    end

    def compare_positions(board, position_1, position_2)
      if board.valid_move?(position_1) == true || board.valid_move?(position_2) == true
        false
      elsif board.position(position_1) != self.token && board.position(position_2) != self.token
        true
      end
    end

  end
end

#original logic w/out AI
#until board.valid_move?(position)
#  position = rand(1..9).to_s
#end

#0.5 was a good amount of time to rest for single player mode and 1 play c vs c mode
#0.2 needs testing on wargames mode - is it too quick?


#i get to determine the logic!
#strive to build unbeatable logic
#ldook into min/max algorithm

### LOGIC ###
#    iterate over WIN_COMBINATIONS
#      if any combo has 2 of the other players tokens
#        fill the empty spot   -- use #check_win_combos_for_2
#      elsif board.valid_move?(center)
#        position = center
#      elsif iterate over corners_array [1, 3, 7, 9]
#        if !board.valid_move?(corner)
#          position = corner - 1 || corner + 1 || corner - 3 || corner + 3
#        else
#          position = corners_array[0]
#        end
#      end


### ORIGINAL LOGIC CODE ###
#pare this shit down... go step by step through the logic and add as necessary

  #if check_win_combos_for_2(board) != ""
  #  position = check_win_combos_for_2(board)
  #elsif board.valid_move?("5")
  #  position = "5"
  #elsif position == ""
  #  self.corners.each.with_index do |corner, i|
  #    #use fucking WHILE
  #    if !board.valid_move?(corner) && board.position != self.token
  #      while position == ""
  #        index_adjustments = [1, -1, 3, -3]
  #        index_adjustments.each do |adj|
  #          position = self.corners[index + adj]
  #        end
  #      end
        #position = self.corners[index - 1] unless !board.valid_move?(self.corners[index - 1])
        #position = self.corners[index + 1] unless !board.valid_move?(self.corners[index + 1])
        #position = self.corners[index - 3] unless !board.valid_move?(self.corners[index - 3])
        #position = self.corners[index + 3] unless !board.valid_move?(self.corners[index + 3])
  #    elsif board.valid_move?(corner)
  #      position = corner
  #    end # inner corners if statment
  #  end #corners iteration statement
  #else
  #  self.sides.each {|side| position = side if board.valid_move?(side)}
  #end #overall logic if statement
