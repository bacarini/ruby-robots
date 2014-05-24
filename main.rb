Dir["lib/**/*.rb"].each { |file| load file }

input = File.readlines("input.txt")
file_pointer =  0

robot = Robot.new(Table.new)

while file_pointer < input.size
  begin
    robot.execute input[file_pointer].chomp
    file_pointer += 1
  rescue Exception => e
    raise "Error: #{e.message}. Please check your input and try again!"
  end
end
