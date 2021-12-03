# Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together.
# What is the power consumption of the submarine?

def flip_bits(input)
  mapping = { "0" => "1", "1" => "0" }

  input.split("").map { |i| mapping[i] }.join
end

file_data = File.read("puzzle_5_input.txt").split("\n")

popularity_stats = []

file_data.each do |fd|
  fd.split("").each_with_index do |bit, index|
    popularity_stats[index] ||= { "0" => 0, "1" => 0 }

    popularity_stats[index][bit] += 1
  end
end

gamma_rate = popularity_stats.map { |bit_stats| bit_stats["0"] > bit_stats["1"] ? "0" : "1" }.join # its bits are the most common value for their respective positions across the input list
epsilon_rate = flip_bits(gamma_rate) # its bits are flipped from gamma_rate

puts "gamma_rate: #{gamma_rate}"
puts "epsilon_rate: #{epsilon_rate}"

gamma_as_decimal = gamma_rate.to_i(2)
epsilon_as_decimal = epsilon_rate.to_i(2)
power_consumption = gamma_as_decimal * epsilon_as_decimal

puts "gamma_rate (decimal): #{gamma_as_decimal}"
puts "epsilon_rate (decimal): #{epsilon_as_decimal}"
puts "power consumption: #{power_consumption}"
