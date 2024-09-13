class DNA
  def initialize(seq1)
    @seq1 = seq1
  end

  def hamming_distance(seq2)
    counter = 0
    [@seq1.size, seq2.size].min.times do |idx|
      counter += 1 if @seq1[idx] != seq2[idx]
    end
    counter
  end
end