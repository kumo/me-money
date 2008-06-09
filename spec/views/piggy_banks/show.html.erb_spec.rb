require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/piggy_banks/show.html.erb" do
  include PiggyBanksHelper
  
  before(:each) do
    @piggy_bank = mock_model(PiggyBank)
    @piggy_bank.stub!(:name).and_return("MyString")
    @piggy_bank.stub!(:balance_in_pence).and_return("1")
    @piggy_bank.stub!(:goal_in_pence).and_return("1")
    @piggy_bank.stub!(:due_on).and_return(Date.today)

    assigns[:piggy_bank] = @piggy_bank
  end

  it "should render attributes in <p>" do
    render "/piggy_banks/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

