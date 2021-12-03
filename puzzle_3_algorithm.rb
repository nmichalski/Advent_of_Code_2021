# Calculate the horizontal position and depth you would have after following the planned course.
# What do you get if you multiply your final horizontal position by your final depth?

file_data = File.read("puzzle_3_input.txt").split("\n")
commands = file_data.map { |fd| { direction: fd.split(" ")[0], amount: fd.split(" ")[1].to_i } }

x_position = 0
y_position = 0

# do the thing to calculate final x_position, y_position
commands.each do |command|
  case command[:direction]
  when "forward"
    x_position += command[:amount]
  when "down"
    y_position -= command[:amount]
  when "up"
    y_position += command[:amount]
  end
end

depth = -y_position
product = x_position * depth

puts "x_position * depth: #{product}"
