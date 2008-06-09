require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/piggy_banks/show.html.erb" do
  include PiggyBanksHelper
  
  before(:each) do
    @piggy_bank = mock_model(PiggyBank)
    @piggy_bank.stub!(:name).and_return("PiggyBankName")
    @piggy_bank.stub!(:balance_in_pence).and_return("Balance")
    @piggy_bank.stub!(:amount_to_go_in_pence).and_return("AmountToGo")
    @piggy_bank.stub!(:goal_in_pence).and_return("Goal")
    @piggy_bank.stub!(:due_on).and_return(Date.today)
    @piggy_bank.stub!(:days_to_go).and_return(3)

    assigns[:piggy_bank] = @piggy_bank
  end

  it "should render attributes in <p>" do
    render "/piggy_banks/show.html.erb"
    response.should have_text(/PiggyBankName/)
    response.should have_text(/Balance/)
    response.should have_text(/Goal/)
    response.should have_text(/3/)
    response.should have_text(/AmountToGo/)
  end
end

