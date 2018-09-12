require 'pry'
require_relative '../config/environment'
# require_relative '../app/models/currency.rb'
# require_relative '../app/models/transactions.rb'
# require_relative '../app/models/user.rb'
require_relative '../lib/commandLine.rb'

#program logic:

#User data is already seeded


# ali = User.create(name: "Ali")
# ali.activate_account
# ali.add_usd_to_balance(15000)
# ali.buy_crypto_currency("btc", 2)

CommandLine.welcome
CommandLine.instructions
CommandLine.prompt_user_name

#Display menu only after user has opened account
def run
  case CommandLine.menu
    when '1'
      CommandLine.user_add_balance
      # binding.pry
      run
    when '2'
      #Enter the research centre
      case CommandLine.menu_research_centre
        when '1'
          CommandLine.user_get_latest_prices
          CommandLine.menu_research_centre
        when '2'
          p "Please enter the the 'symbol' of the cryptocurrency that you would like a price for"
          user_input = gets.chomp
          Currency.get_market_quote(user_input)
          CommandLine.menu_research_centre
        when '3'
          p Currency.get_top_ten
          CommandLine.menu_research_centre
        when 'q'
          run
        else
          puts "That's not a valid entry"
          run
        end
    when '3'
      CommandLine.choose_currency_to_buy
      run
    when '4'
      CommandLine.choose_currency_to_sell
      run
    when 'q'
      exit
    else
      puts "That's not a valid entry"
      run
    end
end

run


puts "HELLO WORLD"
