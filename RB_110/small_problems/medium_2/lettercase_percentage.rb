UPPER = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LOWER = UPPER.downcase

def letter_case_count(string)
  lowercase = []
  uppercase = []
  neither = []
  string.each_char do |char|
    if UPPER.include?(char)
      uppercase << char
    elsif LOWER.include?(char)
      lowercase << char
    else
      neither << char
    end
  end
  case_count = {lowercase: lowercase.size, uppercase: uppercase.size, neither: neither.size}
end

def letter_percentages(string)
  case_count = letter_case_count(string)
  total = case_count.values.inject(:+)
  case_count.each do |k, v|
    case_count[k] = ((v * 100) / total.to_f).round(1)
  end
  case_count
end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')