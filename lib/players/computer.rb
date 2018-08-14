
module Players
  class Computer < Player

    attr_accessor :board

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

    CORNERS = [0, 2, 8, 6]

    def move(board)
      sleep(1.5)
      if self.win_move_available?(board)
        self.win_move(board).to_s
      elsif self.block_move_available?(board)
        self.block_move(board).to_s
      elsif self.middle_move_available?(board)
        self.middle_move.to_s
      elsif self.best_corner_move_available?(board)
        self.corner_move(board).to_s
      else
        self.random_move.to_s
      end
    end

    def win_move_available?(board)
      WIN_COMBINATIONS.find do |combination|
        (board.cells[combination[0]] == self.token && board.cells[combination[1]] == self.token &&    board.cells[combination[2]] == " ") || (board.cells[combination[0]] == self.token &&     board.cells[combination[2]] == self.token && board.cells[combination[1]] == " ") ||    (board.cells[combination[1]] == self.token && board.cells[combination[2]] == self.token &&    board.cells[combination[0]] == " ")
      end
    end

    def win_move(board)
      winning_combination = WIN_COMBINATIONS.find do |combination|
        (board.cells[combination[0]] == self.token && board.cells[combination[1]] == self.token &&    board.cells[combination[2]] == " ") || (board.cells[combination[0]] == self.token &&     board.cells[combination[2]] == self.token && board.cells[combination[1]] == " ") ||    (board.cells[combination[1]] == self.token && board.cells[combination[2]] == self.token &&    board.cells[combination[0]] == " ")
      end
      win_index = winning_combination.find do |position|
        board.cells[position] == " "
      end
      win_position = win_index + 1
      win_position
    end

    def other_player_token
      other_player_token = (self.token == "X") ? "O" : "X"
    end

    def block_move_available?(board)
      WIN_COMBINATIONS.find do |combination|
        (board.cells[combination[0]] == self.other_player_token && board.cells[combination[1]] == self.other_player_token &&    board.cells[combination[2]] == " ") || (board.cells[combination[0]] == self.other_player_token &&     board.cells[combination[2]] == self.other_player_token && board.cells[combination[1]] == " ") ||    (board.cells[combination[1]] == self.other_player_token && board.cells[combination[2]] == self.other_player_token &&    board.cells[combination[0]] == " ")
      end
    end

    def block_move(board)
      blocking_combination = WIN_COMBINATIONS.find do |combination|
        (board.cells[combination[0]] == self.other_player_token && board.cells[combination[1]] == self.other_player_token &&    board.cells[combination[2]] == " ") || (board.cells[combination[0]] == self.other_player_token &&     board.cells[combination[2]] == self.other_player_token && board.cells[combination[1]] == " ") ||    (board.cells[combination[1]] == self.other_player_token && board.cells[combination[2]] == self.other_player_token &&    board.cells[combination[0]] == " ")
      end
      block_index = blocking_combination.find do |position|
        board.cells[position] == " "
      end
      block_position = block_index + 1
      block_position
    end

    def middle_move_available?(board)
      if board.cells[4] == " "
        true
      else
        false
      end
    end

    def middle_move
      5
    end

    def opposite_corner(corner)
      if corner == 0
        8
      elsif corner == 8
        0
      elsif corner == 2
        6
      elsif corner == 6
        2
      end
    end

    def best_corner_move_available?(board)
      CORNERS.find {|corner| board.cells[corner] == " "}
    end

    def corner_move(board)
      random_corners = CORNERS.shuffle
     if random_corners.find {|corner| (board.cells[corner] == " ") && (self.opposite_corner(corner) == self.other_player_token)}
       corner_index = random_corners.find {|corner| (board.cells[corner] == " ") && (self.opposite_corner(corner) == self.other_player_token)}
     elsif random_corners.find {|corner| (board.cells[corner] == " ") && (self.opposite_corner(corner) == self.token)}
       corner_index = random_corners.find {|corner| (board.cells[corner] == " ") && (self.opposite_corner(corner) == self.token)}
     else
       corner_index = random_corners.sample
     end
      corner_move = corner_index + 1
      corner_move
    end

    def random_move
      positions = self.game.board.cells.select {|cell| cell == " "}
      binding.pry
      positions.sample
    end

  end
end
