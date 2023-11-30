def DNA_strand(dna)
  dna = dna.split('')
  dna.map! do |letter|
    case letter
    when "A"
      "T"
    when "T"
      "A"
    when "C"
      "G"
    when "G"
      "C"
    end
  end
  dna.join
end

# "ATTGC" --> "TAACG"
# "GTAT" --> "CATA"
p DNA_strand("ATTGC")


# better solution from Codewars
# def DNA_strand(dna)
#   dna.gsub(/[ATGC]/, "A" => "T", "T" => "A", "C" => "G", "G" => "C")
# end