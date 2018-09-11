class CommandLine

  def welcome
    p "Thank you for choosing CRYPT-O-ZONE, we're here to make your dreams come true"
  end

  def instructions
    p "Step 1: Open an account."
    p "Step 2: Use our research centre to unleash synergistic functionalities."
  end

  def prompt_user_name
    p "Please choose a user name."
    user_input = gets.chomp
    @user_account = User.create(name: user_input)
    @user_account.activate_account
  end

  def user_add_balance
    p "Please deposit US Dollars into your account to start trading."
    p "Amount:"
    balance_input = gets.chomp
      if balance_input.is_a? Integer
      @user_account.add_usd_to_balance(balance_input)
      else
      "Invalid input. Please enter a whole number."
      end
  end

  def user_get_latest_prices
   p "Are you seeking the truth? Enter YES to get lastest Crypto Currency prices."
   latest_prices_input = gets.chomp
     if latest_prices_input.downcase == "yes"
        Currency.get_latest_prices
     elsif latest_prices_input.downcase == "no"
        p "Okay!"
     else
        p "Invalid Input"
     end
  end

  def choose_currency_can_buy
    p "We sell the following cryptocurrencies:"
    p "- Bitcoin (BTC)"
    p "- Ethereum (ETH)"
    p "- XRP (Ripple) (XRP)"
    p "- Bitcoin Cash (BCH)"
    p "- EOS (EOS)"
    p "- Stellar (XLM)"
    p "- Litecoin (LTC)"
    p "- Tether (USDT)"
    p "- Cardano (ADA)"
    p "- Monero (XMR)"
    p "Please enter symbol to make your choice!"
    currency_choice = gets.chomp
    p "Please enter amount."
    amount_entered = gets.chomp
    if amount_entered.is_a? Integer
      buy_crypto_currency(currency_choice, amount_entered)
    else
      p "Invalid amount"
    end
  end


end
