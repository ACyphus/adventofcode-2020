file = File.new("input.d2c1.txt")
input = file.readlines.map(&:chomp)

def password_valid?(item)
  parts = item.scan(/\w+/) 
  range = Range.new(parts[0].to_i, parts[1].to_i)
  char = parts[2]
  password = parts[3]

  char_counter = 0

  password.each_char do |pchar|
    char_counter += 1 if pchar == char
  end
  
  range.include?(char_counter)
end

valid_passwords = 0

input.each do |item|
  valid_passwords += 1 if password_valid?(item)
end

puts "There are #{valid_passwords} valid passwords in this list."
