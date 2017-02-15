require "json"
require "sinatra"

get '/' do
  return status 406 unless request.accept? 'application/json'
  meta = [
    {
      :url => '/menu',
      :methods => 'GET'
    },
    {
      :url => '/order',
      :methods => ['GET', 'POST']
    }
  ]
  meta.to_json
end

get '/menu' do
  return status 406 unless request.accept? 'application/json'

  menu = {
    :types => ['flat white', 'latte'],
    :strength => ['strong', 'weak']
  }

  meta = [
    {
      :url => '/order',
      :methods => ['GET', 'POST']
    }
  ]

  {
    :menu => menu,
    :meta => meta
  }.to_json
end

get '/order' do
  order = {
    :type => "",
    :quantity => 0,
    :strength => ""
  }

  meta = [
    {
      :url => '/order',
      :methods => ['POST']
    }
  ]

  {:order => order, :meta => meta}.to_json
end

post "/order" do
  order = JSON.parse(request.body.read)['order']

  quantity = order["quantity"]
  strength = order["strength"]
  type = order["type"]

  new_order = Order.new(type, quantity, strength)
  response.headers['Location'] = "/order/#{new_order.id}"

  redirect "/order/#{new_order.id}", 302
end

get "/order/4" do
  order = Order.new()
  meta = [
    {
      :uri => 'pay?order=4',
      :methods => ['GET', 'POST']
    }
  ]
  {:order => order, :meta => meta}.to_json
end

get "/payment" do

end

post "/payment" do

end

class Order
  def initialize(type, quantity, strength)
    @type = type || "latte"
    @quantity = quantity || 1
    @strength = strength || "weak"
  end
  def id
    4
  end
  def price
    20
  end
end
#trans, order, payment
#travci, heroku, github
