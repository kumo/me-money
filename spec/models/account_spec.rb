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
