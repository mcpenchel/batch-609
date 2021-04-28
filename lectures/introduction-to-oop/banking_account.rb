class BankingAccount

  def initialize
    @balance = 0
  end

  def withdraw(amount)
    change_balance(-amount)
  end

  def deposit(amount)
    change_balance(amount)
  end

  private
  def change_balance(amount)
    @balance += amount
  end
end