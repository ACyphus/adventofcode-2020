file = File.new("input.d1c1.txt")

input = file.readlines.map(&:chomp).map(&:to_i)

input.each do |first_number|
  input.each do |second_number|
    if first_number + second_number == 2020
      result = first_number * second_number
      puts "Success! #{first_number} * #{second_number} = #{result}"
    end
  end
end
