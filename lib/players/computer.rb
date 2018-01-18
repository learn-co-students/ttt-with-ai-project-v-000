# require_relative "../../config/environment.rb"

module Players
  class Computer < Player
    attr_accessor :cells
    attr_reader :opponent

    def initialize(token)
      super
      @opponent = self.token == "X" ? "O" : "X"
    end

    def move(board)
      self.cells = board.cells.dup # dirty but I don't care

      # is it the first turn? take the corner!
      if self.cells.all? { |c| c == " " }
        return "1"

      # can you win? do it!
      elsif self.win_spots.first
        to_input(self.win_spots.first)

      # can they win next turn? block 'em!
      elsif self.block_win?
        to_input(self.block_win?)

      # can you fork? do it!
      elsif self.fork_spots.first
        to_input(self.fork_spots.first)

      # can they fork next turn? block 'em!
      elsif self.block_fork?
        to_input(self.block_fork?)

      # okay, no forced moves... let's think.
      else
        # where is that guy?
        opp_index = self.cells.index(self.opponent)

        # did they just play the first turn?
        if board.turn_count == 1
          # did they take center? if yes, take a corner, and if not, grab center
          opp_index == 4 ? "1" : "5"

        # okay, turn 3... you got to play first so you're in the top left corner
        elsif board.turn_count == 2

          # did they take center? then take the opposite corner
          if opp_index == 4
            "9"

          # so they didn't take center. edges are odd and corners are even, so...
          else
            # if they took a corner, take another corner, if not, grab center
            opp_index.even? ? to_input(self.free_corner) : "5"
          end

        # okay, so it's mid-game and there are no obvious moves?
        else
          # make a threat if you can, otherwise take a corner (or whatever is left)
          final = self.threat_spots.first || self.free_corner || self.free_move
          to_input(final)
        end
      end
    end

    def to_input(index)
      (index + 1).to_s
    end

    def free_corner
      self.cells.index.with_index { |cell, i| cell == " " && i.even? && i != 4 }
    end

    def free_move
      self.cells.index(" ")
    end

    def block_win?
      # returns the index of the space in a threat you must block, or nil if
      # there isn't one
      self.win_spots(self.opponent).first
    end

    def block_fork?
      # returns the index of a space where the opponent can "fork" (set up a
      # double threat), or nil if there isn't one
      if self.fork_spots(self.opponent).first
        # if the opponent has a fork opportunity, make a threat or block it
        self.threat_spots.first || self.fork_spots(self.opponent).first
      end
    end

    def threat_spots(token=self.token)
      # returns a list of indices the token can take to threaten a win
      potential = [" ", " ", "#{token}"]
      Game::WIN_COMBINATIONS.inject([]) do |memo, combo|
        seq = [self.cells[combo[0]], self.cells[combo[1]], self.cells[combo[2]]]
        if seq.sort == potential
          memo << combo.reject { |i| self.cells[i] == "#{token}" }
        end
        memo.flatten.uniq
      end
    end

    def win_spots(token=self.token)
      # returns a list of indices the token can take to fulfill a threat and win
      threat = [" ", "#{token}", "#{token}"]
      Game::WIN_COMBINATIONS.inject([]) do |memo, combo|
        seq = [self.cells[combo[0]], self.cells[combo[1]], self.cells[combo[2]]]
        memo << combo[seq.index(" ")] if seq.sort == threat
        memo
      end
    end

    def fork_spots(token=self.token)
      # returns a list of indices the token can take to fork (create a double
      # threat)

      # going to have to use self.cells practically for a theoretical solution,
      # so we'll store a backup to restore it later
      cells_backup = self.cells.dup

      # get a list of possible move spaces (blank spaces)
      spaces = []
      self.cells.each_with_index do |cell, i|
        spaces << i if cell == " "
      end

      # For each space you could move, put a token at that index. Then, check
      # to see if there are any spots from there that you could place to win
      # (a.k.a. check to see if you just made a "threat" spot, and get a list
      # of how many positions could be currently taken to win the game). If
      # placing a token at that position will create two or more ways to win,
      # save that index in the memo array, reset the board, do it over and over
      # again, and (finally) return that array!
      # Making a move at one of those indices will guarantee you a win, as
      # long as there is no existing threat from your opponent.
      spaces.inject([]) do |memo, i|
        self.cells[i] = token
        if self.win_spots(token).length > 1
          memo << i
        end
        # binding.pry
        self.cells = cells_backup.dup
        memo
      end
    end
  end
end
