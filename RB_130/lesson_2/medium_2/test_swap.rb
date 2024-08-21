require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'swap'

class TextTest < Minitest::Test
  def setup
    @sample_file = File.open('sample.txt')
  end

  def test_swap
    text_read = @sample_file.read
    text = Text.new(text_read)
    assert_equal(text_read.gsub('a', 'e'), text.swap('a', 'e'))
  end

  def test_word_count
    text_read = @sample_file.read
    assert_equal(72, Text.new(text_read).word_count)
  end

  def teardown
    @sample_file.close
  end
end