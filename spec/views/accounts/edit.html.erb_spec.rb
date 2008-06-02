require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/edit.html.erb" do
  include AccountsHelper
  
  before do
    @account = mock_model(Account)
    @account.stub!(:name).and_return("MyString")
    @account.stub!(:balance_in_pence).and_return("1")
    assigns[:account] = @account
  end

  it "should render edit form" do
    render "/accounts/edit.html.erb"
    
    response.should have_tag("form[action=#{account_path(@account)}][method=post]") do
      with_tag('input#account_name[name=?]', "account[name]")
      with_tag('input#account_balance_in_pence[name=?]', "account[balance_in_pence]")
    end
  end
end


