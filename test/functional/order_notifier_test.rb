require 'test_helper'

MiniTest::MINI_DIR = "bugfix"

class OrderNotifierTest < ActionMailer::TestCase
  test "recieved" do
    order = orders(:one)
    mail = OrderNotifier.recieved(order)
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["mike@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    order = orders(:one)
    mail = OrderNotifier.shipped(order)
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["mike@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, 
      mail.body.encoded
  end

end
