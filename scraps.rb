This is a scraps file.  Does this work ok?




game = Game.new


tim = Players::Human.new("X")
bot = Players::Computer.new("O")
game = Game.new(tim, bot)

-----
#This works
def puttable(one:, two:)
  puts "This is the first thing: #{one}"
  puts "This is the second thing: #{two}"
end

puttable(two: "umph", one: "whack")

-----
# This does not work
def puttable2(one:, two: = "rando")
  puts "This is the first thing: #{one}"
  puts "This is the second thing: #{two}"
end

puttable2(two: "umph", one: "whack")
puttable2(one: "whack")

-----
#This works instead.  You need default arguments for all.  I guess you can use nil.
def puttable2(one: "onsey", two: "rando")
  puts "This is the first thing: #{one}"
  puts "This is the second thing: #{two}"
end

puttable2(two: "umph", one: "whack")
puttable2(one: "whack")
------

def ok?(let)
  if let == /aeiou/
    puts "ok!"
  end
end
