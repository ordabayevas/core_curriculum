require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction_sample = Transaction.new(100)
    @cash_register_sample = CashRegister.new(5000)
  end

  def test_accept_money
    @transaction_sample.amount_paid = 50
    initial_total_money = @cash_register_sample.total_money
    assert_equal(initial_total_money + 50, @cash_register_sample.accept_money(@transaction_sample))
    assert_equal(initial_total_money + 50, @cash_register_sample.total_money)
  end

  def test_change
    @transaction_sample.amount_paid = 150
    change_amount = @transaction_sample.amount_paid - @transaction_sample.item_cost
    assert_equal(change_amount, @cash_register_sample.change(@transaction_sample))
  end

  def test_give_receipt
    File.open('output.txt', 'w') do |file|
      $stdout = file
      @cash_register_sample.give_receipt(@transaction_sample)
    end
 
    read = File.read('output.txt')

    assert_equal("You've paid $#{@transaction_sample.item_cost}.\n",read)
  end

end

# def test_give_receipt
#   item_cost = 35
#   register = CashRegister.new(1000)
#   transaction = Transaction.new(item_cost)
#   assert_output("You've paid $#{item_cost}.\n") do
#     register.give_receipt(transaction)
#   end
# end