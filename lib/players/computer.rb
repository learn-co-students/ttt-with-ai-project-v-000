require 'pry'
class Players::Computer < Player
  WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
      ]
  def move(board)
    puts "Computer's move:"
    case board.turn_count
    when 0
      "5"
    when 1
      if board.taken?("5") == true
        choices = [1,3,5,7,9].shuffle
        position = choices.detect{|option| board.taken?(option.to_s) == false}
        "#{position}"
      else
        "5"
      end
    when 2,3,4,5,6,7,8
      if win_move(board) != nil
        win_move(board)
      elsif block_move(board) != nil
        block_move(board)
      elsif two_in_a_row(board) != nil
        two_in_a_row(board)
      else
        x = [1,2,3,4,5,6,7,8,9].shuffle
        position = x.detect{|position| board.taken?(position.to_s) == false}
        "#{position}"
      end
    when 9
      x = [1,2,3,4,5,6,7,8,9]
      position = x.detect{|position| board.taken?(position.to_s) == false}
      "#{position}"
    else
    end
  end

  def win_move(board)
    Players::Computer::WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == self.token && position_2 == " " && position_3 == self.token
        return "#{win_index_2 + 1}"
      elsif position_1 == " " && position_2 == self.token && position_3 == self.token
        return"#{win_index_1 + 1}"
      elsif position_1 == self.token && position_2 == self.token && position_3 == " "
        return "#{win_index_3 + 1}"
      else
        nil
      end
    end
    return nil
  end

  def block_move(board)
      opponent_token = "X" if self.token == "O"
      opponent_token = "O" if self.token == "X"
      Players::Computer::WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

        if position_1 == opponent_token && position_2 == " " && position_3 == opponent_token
          return "#{win_index_2 + 1}"
        elsif position_1 == " " && position_2 == opponent_token && position_3 == opponent_token
          return "#{win_index_1 + 1}"
        elsif position_1 == opponent_token && position_2 == opponent_token && position_3 == " "
          return "#{win_index_3 + 1}"
        else
          nil
        end
      end
      return nil
  end

  def two_in_a_row(board)
    Players::Computer::WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

      if position_1 == " " && position_2 == " " && position_3 == self.token
        return "#{win_index_1 + 1}"
      elsif position_1 == " " && position_2 == self.token && position_3 == " "
        return "#{win_index_1 + 1}"
      elsif position_1 == self.token && position_2 == " " && position_3 == " "
        return "#{win_index_2 + 1}"
      else
        nil
      end
    end
    return nil
  end


end
