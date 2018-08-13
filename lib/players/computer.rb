
module Players
  class Computer < Player

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
      #sleep(1.5)
      if self.win_move_available?
        self.win_move
      elsif self.block_move_available?
        self.block_move
      elsif self.middle_move_available?
        self.middle_move
      elsif self.best_corner_move_available?
        self.corner_move
      else
        self.random_move
      end
    end

    def win_move_available?
      WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.token && self.game.board.cells[combination[1]] == self.token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.token &&     self.game.board.cells[combination[2]] == self.token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.token && self.game.board.cells[combination[2]] == self.token &&    self.game.board.cells[combination[0]] == " ")
      end
    end

    def win_move
      winning_combination = WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.token && self.game.board.cells[combination[1]] == self.token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.token &&     self.game.board.cells[combination[2]] == self.token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.token && self.game.board.cells[combination[2]] == self.token &&    self.game.board.cells[combination[0]] == " ")
      end
      win_index = winning_combination.find do |position|
        self.game.board.cells[position] == " "
      end
      win_position = win_index + 1
      win_position
    end

    def other_player_token
      other_player_token = (self.token == "X") ? "O" : "X"
    end

    def block_move_available?
      WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.other_player_token && self.game.board.cells[combination[1]] == self.other_player_token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.other_player_token &&     self.game.board.cells[combination[2]] == self.other_player_token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.other_player_token && self.game.board.cells[combination[2]] == self.other_player_token &&    self.game.board.cells[combination[0]] == " ")
        #binding.pry
      end
    end

    def block_move
      blocking_combination = WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.other_player_token && self.game.board.cells[combination[1]] == self.other_player_token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.other_player_token &&     self.game.board.cells[combination[2]] == self.other_player_token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.other_player_token && self.game.board.cells[combination[2]] == self.other_player_token &&    self.game.board.cells[combination[0]] == " ")
      end
      block_index = blocking_combination.find do |position|
        self.game.board.cells[position] == " "
      end
      block_position = block_index + 1
      block_position
    end

    def middle_move_available?
      if self.game.board.cells[4] == " "
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

    def best_corner_move_available?
      CORNERS.find {|corner| self.game.board.cells[corner] == " "}
    end

    def corner_move
      random_corners = CORNERS.shuffle
     if random_corners.find {|corner| (self.game.board.cells[corner] == " ") && (self.opposite_corner(corner) == self.other_player_token)}
       corner_index = random_corners.find {|corner| (self.game.board.cells[corner] == " ") && (self.opposite_corner(corner) == self.other_player_token)}
     elsif random_corners.find {|corner| (self.game.board.cells[corner] == " ") && (self.opposite_corner(corner) == self.token)}
       corner_index = random_corners.find {|corner| (self.game.board.cells[corner] == " ") && (self.opposite_corner(corner) == self.token)}
     else
       corner_index = random_corners.sample
     end
      corner_move = corner_index + 1
      corner_move
    end

    def random_move
      position = self.game.avail_moves.sample
      position
    end

  end
end
