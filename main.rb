Dir["lib/**/*.rb"].each { |file| load file }


puts "Welcome to Toy Ruby Robot Simulator"
puts "Be aware of the valid commands"
puts "\n================="
puts "PLACE X,Y,FACING"
puts "LEFT"
puts "RIGHT"
puts "MOVE"
puts "REPORT"
puts "================="
@robot = Robot.new(Table.new)

def valid?(answer)
  answer == "NO" || answer == "YES"
end

def handle_error(&block)
  begin
    block.call
  rescue Exception => e
    raise "Error: #{e.message}. Please check your input and try again!"
  end
end

def by_file
  input = File.readlines("input.txt")
  file_pointer =  0

  while file_pointer < input.size
    handle_error do
      @robot.execute input[file_pointer].chomp
      file_pointer += 1
    end
  end
end

def by_command
  while true
    handle_error do
      puts "Please, enter your command or type exit to leave the system:"
      command = gets.chomp.upcase
      return if command == "EXIT"
      @robot.execute command
    end
  end
end

def start
  puts "The system will proceed to the file input. Would you like to enter your commands manually instead? (yes/no) "
  answer = gets.chomp.upcase
  if  valid?(answer)
    answer == 'YES' ? by_command : by_file
  else
    start
  end
end
