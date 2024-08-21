class TextAnalyzer
  def process
    opened = File.open("sample.txt")
    readed = opened.read
    yield(readed)
    opened.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |text|
  words = text.split(' ').count
  puts "#{words} words"
end

analyzer.process do |text|
  lines = text.split("\n").count
  puts "#{lines} lines"
end

analyzer.process do |text|
  paragraphs = text.split("\n\n").count
  puts "#{paragraphs} paragraphs"
end