module Players
  class Computer < Player
    def move(board_obj)
      if !board_obj.taken?(5)
        move = "5"
      elsif !board_obj.taken?(1)
        move = "1"
      elsif !board_obj.taken?(9)
        move = "9"
      elsif !board_obj.taken?(3)
        move = "3"
      elsif !board_obj.taken?(7)
        move = "7"
      elsif !board_obj.taken?(2)
        move = "2"
      elsif !board_obj.taken?(4)
        move = "4"
      elsif !board_obj.taken?(6)
        move = "6"
      elsif !board_obj.taken?(8)
        move = "8"
      end  
    end
  end
end