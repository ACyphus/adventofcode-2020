file = File.new("input.d4.txt")
input = file.readlines.map(&:chomp)

def process_into_passports(input)
  counter = 0
  passports = []
  input.each do |line|
    passports[counter] = "" if passports[counter] == nil
    if line == ""
      counter += 1
    elsif passports[counter] == ""
      passports[counter] << line 
    else
      passports[counter] << " " + line
    end
  end
  passports
end

def valid_passport?(passport)
  req_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  valid = true
  req_fields.each { |field| valid = false unless passport.include?(field) }
  valid
end

passports = process_into_passports(input)

valid_passports = 0

passports.each {|passport| valid_passports += 1 if valid_passport?(passport) }

p "There are #{valid_passports} valid passports!"
