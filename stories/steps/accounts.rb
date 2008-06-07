steps_for :accounts do
  Given "an account named '$name'" do |name|
    @account = create_account(name)
  end

  Given "the account has $amount euros in it" do |amount|
    @account.update_attribute(:balance_in_pence, amount.to_i)
  end
  
  Given "the account has an entry for $amount euros named '$name'" do |amount, name|
    @entry = @account.entries.create!(:amount_in_pence => amount, :description => name)
    
    # NOTE: the account's balance will have been changed when the entry
    # was created, so we will need to reset the balance to the original amount.
    @account.reload
    @account.update_attribute(:balance_in_pence, @account.balance_in_pence + @entry.amount_in_pence)
  end
   
  When "I spend $amount euros" do |amount|
    post_via_redirect "/accounts/#{@account.id}/entries", :entry => {:amount_in_pence => amount.to_i, :description => "new entry", :account_id => @account.id}
  end
  
  Then "the account balance should now be $amount euros" do |amount|
    lambda {
      @account.reload
    }.should change(@account, :balance_in_pence).to(amount.to_i)
  end

  Then "the account balance should still be $amount euros" do |amount|
    @account.reload
    @account.balance_in_pence.should == amount.to_i
  end
end

def create_account(name)
  Account.create!(:name => name)
end