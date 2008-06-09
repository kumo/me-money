require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/piggy_banks/index.html.erb" do
  include PiggyBanksHelper
  
  before(:each) do
    piggy_bank_98 = mock_model(PiggyBank)
    piggy_bank_98.should_receive(:name).and_return("MyString")
    piggy_bank_98.should_receive(:balance_in_pence).and_return("1")
    piggy_bank_98.should_receive(:goal_in_pence).and_return("1")
    piggy_bank_98.should_receive(:due_on).and_return(Date.today)
    piggy_bank_99 = mock_model(PiggyBank)
    piggy_bank_99.should_receive(:name).and_return("MyString")
    piggy_bank_99.should_receive(:balance_in_pence).and_return("1")
    piggy_bank_99.should_receive(:goal_in_pence).and_return("1")
    piggy_bank_99.should_receive(:due_on).and_return(Date.today)

    assigns[:piggy_banks] = [piggy_bank_98, piggy_bank_99]
  end

  it "should render list of piggy_banks" do
    render "/piggy_banks/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

