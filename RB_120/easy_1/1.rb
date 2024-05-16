# class Banner
#   attr_reader :message
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     '+-' + ('-' * message.size) + '-+'
#   end

#   def empty_line
#     '| ' + (' ' * message.size) + ' |'
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner

# Further exploration
class Banner
  def initialize(message, width)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def empty_line
    "| #{' ' * @width} |"
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def message_line
    "| " + @message.center(@width) + " |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 70)
puts banner

