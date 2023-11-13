def center_of(string)
  center_string = string.size / 2
  if string.size.odd?
    index = center_string
    return string[index]
  else
    index1, index2 = (center_string - 1), center_string
    return [string[index1], string[index2]].join
  end
end

p center_of('Saltanata')