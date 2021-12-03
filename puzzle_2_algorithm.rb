# Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?

file_data = File.read("puzzle_2_input.txt").split.map(&:to_i)

count = 0

file_data.each_with_index do |element, index|
  group_1 = [
    element,
    file_data[index + 1],
    file_data[index + 2]
  ]

  group_2 = [
    file_data[index + 1],
    file_data[index + 2],
    file_data[index + 3]
  ]

  next if group_1.any?(&:nil?) || group_2.any?(&:nil?) # reached the end of the list

  count += 1 if group_2.sum > group_1.sum
end

puts "result: #{count} increases"
