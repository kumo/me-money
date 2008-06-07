require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
    @account = Account.new
  end

  it "should be valid" do
    @account.name = "AccountName"
    @account.should be_valid
  end
  
  it "should be invalid without a name" do
    @account.name = ''
    @account.should_not be_valid
    @account.should have(1).error_on(:name)
  end
end

describe Account, "when creating" do
  before(:each) do
    @account = Account.new(:name => "New account")
  end
  
  it "should assign an empty balance if not specified" do
    @account.balance_in_pence = nil
    lambda {
      @account.save
    }.should change(@account, :balance_in_pence).to(0)
  end
  
  it "should not assign a default balance if it has already been specified" do
    @account.balance_in_pence = 35
    lambda {
      @account.save
    }.should_not change(@account, :balance_in_pence)
  end
end