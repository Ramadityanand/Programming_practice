# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { from_user: nil, to_user: "ben", amount: 20000 },
  { from_user: nil, to_user: "brian", amount: 20000 },
  { from_user: "ben", to_user: "evan", amount: 9000 },
  { from_user: "brian", to_user: "anthony", amount: 7000 },
  { from_user: "evan", to_user: "anthony", amount: 400 },
  { from_user: "ben", to_user: "anthony", amount: 1500 },
  { from_user: "anthony", to_user: "ben", amount: 4500 },
  { from_user: "anthony", to_user: "evan", amount: 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# creating balance variable to calculate balance of each user

balance = 0

# creating list of users from the hashes

combined_user = []

for user_send in blockchain
  if user_send[:from_user] == nil
    # Do nothing
  else
  combined_user = combined_user + [user_send[:from_user]]
  end
  for user_received in blockchain
  combined_user = combined_user + [user_received[:to_user]]
  end
end

combined_user = combined_user.uniq
puts combined_user

# Balance calculation

for send in blockchain
  for received in blockchain
    if send[:from_user] == received[:to_user]
      balance = balance + received[:amount]
    else
      balance = balance - received[:amount]
    end
  # puts received[:to_user]
  end
  if send[:from_user] == nil
    # print nothing
  else
  puts "#{send[:from_user].capitalize}'s KelloggCoin balance is #{balance}"
  end
end
