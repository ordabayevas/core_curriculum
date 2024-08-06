# expected_result = <<HEREDOC
# This would contain specially formatted text.

# That might span many lines
# HEREDOC

# expected_result = <<-INDENTED_HEREDOC
# This would contain specially formatted text.

# That might span many lines
#   INDENTED_HEREDOC

expected_result = <<~SQUIGGLY_HEREDOC # for cases when we have indentation in a text
  This would contain specially formatted text.

  That might span many lines
SQUIGGLY_HEREDOC

puts expected_result