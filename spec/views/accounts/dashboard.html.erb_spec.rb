require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/dashboard.html.erb" do
  include AccountsHelper
  
  describe "when there are accounts" do
    before(:each) do
      @account_1 = mock_model(Account)
      @account_2 = mock_model(Account)

      assigns[:accounts] = [@account_1, @account_2]
    end

    it "should show a new entry form" do
      render "/accounts/dashboard.html.erb"
      response.should have_tag("form[id=?]", "new_entry")
    end
  end
  
  describe "when are there no accounts" do
    before(:each) do
      assigns[:accounts] = []
    end
    
    it "should render a message if there are no accounts" do
      render "/accounts/dashboard.html.erb"
      response.should have_tag("p[id=?]", "no_accounts") do
        with_tag("a[href=?]", new_account_url)
      end
    end
    
    it "should not show a new entry form" do
      render "/accounts/dashboard.html.erb"
      response.should_not have_tag("form[id=?]", "new_entry")
    end
  end
end

