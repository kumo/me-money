require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/new.html.erb" do
  include AccountsHelper
  
  before(:each) do
    @account = mock_model(Account)
    @account.stub!(:new_record?).and_return(true)
    @account.stub!(:name).and_return("MyString")
    @account.stub!(:balance_in_pence).and_return("1")
    assigns[:account] = @account
  end

  it "should render new form" do
    render "/accounts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", accounts_path) do
      with_tag("input#account_name[name=?]", "account[name]")
      with_tag("input#account_balance_in_pence[name=?]", "account[balance_in_pence]")
    end
  end
end


