module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def combo_with_two_xs?(board)
      WIN_COMBINATIONS.detect do |combo|
        two_xs = combo.count {|e| board.cells[e] == "X"}
        combo.any? {|e| board.cells[e] == " "} && (two_xs == 2)
      end
    end

    def combo_with_two_os?(board)
      WIN_COMBINATIONS.detect do |combo|
        two_os = combo.count {|e| board.cells[e] == "O"}
        combo.any?{|e| board.cells[e] == " "} && two_os == 2
      end
    end

    def move(board)
      all_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]

      if combo_with_two_xs?(board)
        combo_with_two_xs = combo_with_two_xs?(board)
        (combo_with_two_xs.detect {|e| board.cells[e] == " "}.to_i + 1).to_s
      elsif combo_with_two_os?(board)
        combo_with_two_os = combo_with_two_os?(board)
        (combo_with_two_os.detect {|e| board.cells[e] == " "}.to_i + 1).to_s
      elsif !board.taken?("5")
          "5"
      elsif corners.detect {|string_input| !board.taken?(string_input)}
        corners.detect {|string_input| !board.taken?(string_input)}
      else
        available_moves = all_moves.delete_if {|string_input| board.taken?(string_input)}
        available_moves.sample
      end
    end
  end
end
