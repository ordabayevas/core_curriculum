require 'pry'
require 'pry-byebug'

# ALPHA_1 = %w[A B C D E F G H I J K L M]
# ALPHA_2 = %w[N O P Q R S T U V W X Y Z]

# def decipher(full_name)
#   full_name.chars.map do |letter|
#     if letter == ' '
#       ' '
#     elsif ALPHA_1.include?(letter.upcase)
#       returned = ALPHA_2[ALPHA_1.find_index(letter.upcase)]
#       letter == letter.upcase ? returned : returned.downcase 
#     else
#       # binding.pry
#       returned = ALPHA_1[ALPHA_2.find_index(letter.upcase)]
#       letter == letter.upcase ? returned : returned.downcase 
#     end
#   end.join
# end

def decipher_letter(char)
  case char
  when ('a'..'m'), ('A'..'M')
    (char.ord + 13).chr 
  when ('n'..'z'), ('N'..'Z')
    (char.ord - 13).chr
  else
    ' '
  end
end

def rot_13(name)
  name.chars.map do |char|
    decipher_letter(char)
  end.join
end

p rot_13('Tenpr Ubccre')

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

ROT_SHIFT = Proc.new do |letter|
  if letter =~ /[a-z]/
    (((letter.ord - 96 + 13) % 26) + 96).chr
  else
    (((letter.ord - 65 + 13) % 26) + 65).chr
  end
end

def rot13(name)
  name.gsub(/\w/, &ROT_SHIFT)
end

# further exploration EBCDIC
# 2.6.0 :011 > a = 'Hello'
#  => "Hello" 
# 2.6.0 :012 > b = a.encode('IBM037')
#  => "\xC8\x85\x93\x93\x96" 
# 2.6.0 :013 > b.encode('UTF-8')
#  => "Hello" 