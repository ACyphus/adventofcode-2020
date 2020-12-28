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
  passports.each_with_index do |passport, index|
    passports[index] = passport.scan(/(\w+):(\S+)/).to_h
  end
end

def valid_passport?(passport)
  req_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  valid = true
  req_fields.each do |field|
    valid = false unless passport.include?(field)
  end
  if valid
    passport.each do |field, value|
      valid = false unless valid_field?(field, value)
    end
  end
  valid
end

def valid_field?(field, value)
  case field
  when "byr"
    value.length == 4 && value.to_i.between?(1920, 2002)
  when "iyr"
    value.length == 4 && value.to_i.between?(2010, 2020)
  when "eyr"
    value.length == 4 && value.to_i.between?(2020, 2030)
  when "hgt"
    parts = value.scan(/(\d+)(\D+)/)
    parts.flatten!
    valid = true if value.length == 4 || value.length == 5
    if valid
      if parts[1] == "cm"
        valid = false unless (150..193).include?(parts[0].to_i)
      elsif parts[1] == "in"
        valid = false unless (59..76).include?(parts[0].to_i)
      else
        valid = false
      end
      valid
    end
  when "hcl"
    if value.length == 7
      valid = true
      value.each_char do |char|
        valid = false unless char == "#" || ("a".."f").include?(char) || (0..9).include?(char.to_i)
      end
      valid
    else
      return false
    end
  when "ecl"
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(value) 
  when "pid"
    value.length == 9
  when "cid"
    true
  else
    false
  end
end

passports = process_into_passports(input)
valid_passports = 0
passports.each {|passport| valid_passports += 1 if valid_passport?(passport) }
p "There are #{valid_passports} valid passports!"
