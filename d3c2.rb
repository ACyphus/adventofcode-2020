file = File.new("input.d3c1.txt")
input = file.readlines.map(&:chomp)

def calc_trees(input, right, down)
  trees = 0
  x_pos = 0
  y_pos = 0

  until y_pos == input.length - 1 do
    y_pos += down
    x_pos += right
    
    trees += 1 if input[y_pos].slice(x_pos) == "#"
    x_pos -= input[0].length if x_pos >= input[0].length - right 
  end
  puts "There are #{trees} trees on this route."
  trees
end

route1 = calc_trees(input, 1, 1)
route2 = calc_trees(input, 3, 1)
route3 = calc_trees(input, 5, 1)
route4 = calc_trees(input, 7, 1)
route5 = calc_trees(input, 1, 2)

puts "Answer: #{route1 * route2 * route3 * route4 * route5} trees"
