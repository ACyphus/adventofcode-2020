file = File.new("input.d1c1.txt")

input = file.readlines.map(&:chomp).map(&:to_i)

input.each do |first_number|
  input.each do |second_number|
    input.each do |third_number|
      if first_number + second_number + third_number == 2020
        result = first_number * second_number * third_number
        puts "Success! #{first_number} * #{second_number} * #{third_number} = #{result}"
      end
    end
  end
end
