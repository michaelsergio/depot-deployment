(0..100).each do |i|
  order = Order.new
  order.name = i
  order.email = "user#{i}@example.com"
  order.address = "Pod #{i}, Matrix"
  order.pay_type = Order::PAYMENT_TYPES.sample
  order.save
end

