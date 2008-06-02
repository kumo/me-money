require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/index.html.erb" do
  include AccountsHelper
  
  before(:each) do
    account_98 = mock_model(Account)
    account_98.should_receive(:name).and_return("MyString")
    account_98.should_receive(:balance_in_pence).and_return("1")
    account_99 = mock_model(Account)
    account_99.should_receive(:name).and_return("MyString")
    account_99.should_receive(:balance_in_pence).and_return("1")

    assigns[:accounts] = [account_98, account_99]
  end

  it "should render list of accounts" do
    render "/accounts/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

