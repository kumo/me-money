require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  before(:each) do
    @entry = Entry.new
  end
  
  it "should be valid" do
    @entry.description = "EntryDescription"
    @entry.account = mock_model(Account)
    @entry.amount_in_pence = 3
    @entry.should be_valid
  end

  it "should be invalid without a description" do
    @entry.description = ''
    @entry.should_not be_valid
    @entry.should have(1).error_on(:description)
  end

  it "should be invalid without an account" do
    @entry.account = nil
    @entry.should_not be_valid
    @entry.should have(1).error_on(:account)
  end
  
  it "should be invalid without a non-numeric amount_in_pence" do
    @entry.amount_in_pence = "XXX"
    @entry.should_not be_valid
    @entry.should have(1).error_on(:amount_in_pence)
  end

  it "should be invalid without a non-integer amount_in_pence" do
    @entry.amount_in_pence = "3.2"
    @entry.should_not be_valid
    @entry.should have(1).error_on(:amount_in_pence)
  end
end
