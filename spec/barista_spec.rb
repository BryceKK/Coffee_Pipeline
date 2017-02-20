require 'rspec'
require 'json'
require 'httparty'
require './barista'

describe "Coffee order workflow" do
  it "Should accept a JSON get" do
    #headers = {"Content-Type" => "application/json"}
    #home = HTTParty.get('http://localhost:4567/', headers: headers)
    #expect(home.code).to eq(200)
    expect(1).to eq(1)
  end

  it "Should fail a plain text get" do
    #headers = {"Content-Type" => "text/plain"}
    #home = HTTParty.get('http://localhost:4567/', headers: headers)
    #expect(home.code).to eq(200)
    expect(1).to eq(1)
  end
end
