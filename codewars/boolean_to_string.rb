def bool_to_word bool
  bool ? 'yes': 'no'
end

p bool_to_word(false)