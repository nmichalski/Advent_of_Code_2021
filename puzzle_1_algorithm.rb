# How many measurements are larger than the previous measurement?

file_data = File.read("puzzle_1_input.txt").split.map(&:to_i)

count = 0

file_data.each_with_index do |element, index|
  next_element = file_data[index + 1]
  next unless next_element # reached the end of the list

  count += 1 if next_element > element
end

puts "result: #{count} increases"
