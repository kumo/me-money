steps_for :piggy_banks do
  Given "a piggy bank named '$name'" do |name|
    @piggy_bank = create_piggy_bank(name)
  end

  Given "the piggy bank has $amount euros in it" do |amount|
    @piggy_bank.update_attribute(:balance_in_pence, amount.to_i)
  end

  Given "the piggy bank has a goal of $amount euros" do |amount|
    @piggy_bank.update_attribute(:goal_in_pence, amount.to_i)
  end

  When "I add $amount euros to the piggy bank" do |amount|
    post_via_redirect "/accounts/#{@piggy_bank.id}/entries", :entry => {:amount_in_pence => -amount.to_i, :description => "new entry", :account_id => @piggy_bank.id}
  end

  Then "I should have $amount euros in the piggy bank" do |amount|
    lambda {
      @piggy_bank.reload
    }.should change(@piggy_bank, :balance_in_pence).to(amount.to_i)
  end
  
  Then "I should now have $amount euros in the piggy bank" do |amount|
    lambda {
      @piggy_bank.reload
    }.should change(@piggy_bank, :balance_in_pence).to(amount.to_i)
  end

  Then "I should still have $amount euros in the piggy bank" do |amount|
    @piggy_bank.reload
    @piggy_bank.balance_in_pence.should == amount.to_i
  end

  Then "I should have $amount euros to go" do |amount|
    @piggy_bank.amount_to_go_in_pence.should == amount.to_i
  end
  
  Then "the piggy bank goal should be reached" do
    @piggy_bank.goal_reached?.should == true
  end

  Then "the piggy bank goal should not be reached" do
    @piggy_bank.goal_reached?.should == false
  end
  
  Then "the piggy bank should not have a goal" do
    @piggy_bank.has_goal?.should == false
  end
end

def create_piggy_bank(name)
  PiggyBank.create!(:name => name)
end
