file = File.new("input.d3c1.txt")
input = file.readlines.map(&:chomp)

trees = 0
x_pos = 0
y_pos = 0

until y_pos == input.length - 1 do
  y_pos += 1
  x_pos += 3

  trees += 1 if input[y_pos].slice(x_pos) == "#"
  x_pos -= 31 if x_pos >= 28 
end

puts "There are #{trees} trees on this route."
