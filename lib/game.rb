class Game
WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
@player_1 = player_1
@player_2 = player_2
@board = board
end

def current_player
  count = self.board.turn_count
  if count % 2 == 0
  return self.player_1
else return self.player_2
  end
end

def won?
WIN_COMBINATIONS.each do |combo|
tempx = combo.all? do |number|
self.board.cells[number] == "X"
end
if tempx == true
  return combo
end
tempo = combo.all? do |number|
self.board.cells[number] == "O"
end
if tempo == true
  return combo
end
end
return false
end

def draw?
if self.board.full? == true && self.won? == false
return true
else
return false
end
end

def over?
if self.draw? == true || self.won? != false
return true
else return false
end
end

def winner
WIN_COMBINATIONS.each do |combo|
tempx = combo.all? do |number|
self.board.cells[number] == "X"
end
tempo = combo.all? do |number|
self.board.cells[number] == "O"
end
if tempx == true
return "X"
elsif tempo == true
return "O"
end
end
return nil
end

def turn
input = self.current_player.move(self.board)
player = self.current_player
if !self.board.valid_move?(input)
  self.turn
end
self.board.update(input, player)
end

def play

until self.over? == true
  self.turn
  end
  if self.won? != false
    winner = self.winner
    self.board.display
    puts "Congratulations #{winner}!"
  elsif self.draw? == true
    self.board.display
    puts "Cat's Game!"
end
end

def hello1
  puts "Would you like to go first, yes or no?"
  yesno = gets.strip.upcase
  puts "Would you like to be X or O?"
  xo = gets.strip.upcase

  if yesno == "YES" && xo == "X"
  Game.new(Players::Human.new("X"),Players::Computer.new("O")).play
elsif yesno == "NO" && xo == "X"
  Game.new(Players::Computer.new("O"),Players::Human.new("X")).play
elsif yesno == "YES" && xo == "O"
  Game.new(Players::Human.new("O"),Players::Computer.new("X")).play
elsif yesno == "NO" && xo == "O"
  Game.new(Players::Computer.new("X"),Players::Human.new("O")).play
else
puts "Hmm, didn't quite understand, let's try again."
  self.hello
end
end

def hello2
puts "Should Player 1 be X or O?"
xo = gets.strip.upcase
if xo != "X" || xo != "O"
  puts "Sorry, X or O only, try again."
self.hello2
end
end


def startup
  puts "Hello, and welcome to Tic Tac Toe!"
  puts "Should the game be 0,1,or 2 player?"
  puts "Please choose 0, 1, or 2"
  gametype = gets.strip.to_i

  if gametype > 3 || gametype <0
      puts "Please choose 0, 1, or 2"
    self.startup
  end

  if gametype == 2
  self.hello2
  end

  if gametype == 1
  self.hello1
  end

  if gametype == 0
    Game.new(Players::Computer.new("X"),Players::Computer.new("O")).play
  end

end

end
