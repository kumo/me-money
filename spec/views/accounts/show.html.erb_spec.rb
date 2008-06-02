require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/show.html.erb" do
  include AccountsHelper
  
  before(:each) do
    @account = mock_model(Account)
    @account.stub!(:name).and_return("MyString")
    @account.stub!(:balance_in_pence).and_return("1")

    assigns[:account] = @account
  end

  it "should render attributes in <p>" do
    render "/accounts/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

