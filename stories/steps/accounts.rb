steps_for :accounts do
  Given "an account named '$name'" do |name|
    @account = create_account(name)
  end

  Given "the account has $amount euros in it" do |amount|
    @account.update_attribute(:balance_in_pence, amount.to_i)
  end
   
  When "I spend $amount euros" do |amount|
     post_via_redirect "/accounts/#{@account.id}/entries", :entry => {:amount_in_pence => amount.to_i, :description => "new entry", :account_id => @account.id}
  end
  
  Then "the account balance should now be $amount euros" do |amount|
    @account.reload
    @account.balance_in_pence.should == amount.to_i
  end
  
  Then "I should see the list of entries" do
    response.should render_template("entries/index")
  end
end

def create_account(name)
  Account.create!(:name => name)
end