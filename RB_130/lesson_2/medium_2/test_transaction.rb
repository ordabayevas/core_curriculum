require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  # def test_prompt_for_payment_1
  #   item_cost = 50
  #   transaction = Transaction.new(item_cost)
  #   input = StringIO.new("50\n")

  #   transaction.prompt_for_payment(input: input)

  #   assert_equal(item_cost, transaction.amount_paid)
  # end

  def test_prompt_for_payment_2
    item_cost = 50
    transaction = Transaction.new(item_cost)
    input = StringIO.new("50\n")
    # output = StringIO.new

    # transaction.prompt_for_payment(input: input, output: output)

    # assert_equal(50, transaction.amount_paid)
    #transaction.prompt_for_payment(input: input)

    assert_output("You owe $#{item_cost}.\nHow much are you paying?\n") do
      transaction.prompt_for_payment(input: input)
    end
  end


end
