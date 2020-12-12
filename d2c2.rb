file = File.new("input.d2c1.txt")
input = file.readlines.map(&:chomp)

def password_valid?(item)
  parts = item.scan(/\w+/)
  first_pos = parts[0].to_i - 1
  second_pos = parts[1].to_i - 1
  char = parts[2]
  password_chars = parts[3].chars

  if password_chars[first_pos] == char && password_chars[second_pos] != char 
    return true
  elsif password_chars[first_pos] != char && password_chars[second_pos]  == char 
    return true
  end
end

valid_passwords = 0

input.each do |item|
  valid_passwords += 1 if password_valid?(item)
end

puts "There are #{valid_passwords} valid passwords in this list."
