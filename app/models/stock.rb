class Stock < ApplicationRecord
    def self.new_from_lookup(ticker_symbol)
        begin
            client=IEX::Api::Client.new(publishable_token:'sk_2676b09cf9e549ad97f8bb88dcc17182')
            looked_up_stock= client.quote(ticker_symbol)
            new(name: looked_up_stock.company_name, ticker:looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end
    end
        
 
end
# class Stock < ApplicationRecord
#   has_many :user_stocks
#   has_many :users, through: :user_stocks
 
 
#   def self.find_by_ticker(ticker_symbol)
#     where(ticker: ticker_symbol).first
#   end
 
 
#   def self.new_from_lookup(ticker_symbol)
#     begin
#       client = IEX::Api::Client.new(publishable_token: 'pk_79f5161b3c394ee1b232e3c46c78140b')
#       looked_up_stock = client.quote(ticker_symbol)
#       new(name: looked_up_stock.company_name,
#           ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
#     rescue Exception => e
#       return nil
#     end
#   end
# end