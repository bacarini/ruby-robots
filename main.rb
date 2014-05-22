Dir["lib/**/*.rb"].each { |file| load file }

input = File.readlines("input.txt")
file_pointer =  0

table = Table.new
robot = Robot.new

while file_pointer < input.size
  begin
    robot.execute input[file_pointer].chomp
    file_pointer += 1
  rescue
    raise "Something wrong, please check your input and try again!"
  end
end
