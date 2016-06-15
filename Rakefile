require_relative './config/environment'

puts "Welcome to Tic Tac Toe with AI"

def reload!
  load_all './lib' if Dir.exists?('./lib')
  load_all './config' if Dir.exists?('./config')
end

task :console do
  reload!
  puts "Console Started"
  Pry.start
end