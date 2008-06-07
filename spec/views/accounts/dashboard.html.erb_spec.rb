require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/dashboard.html.erb" do
  include AccountsHelper
  
  describe "when there is one account" do
    before(:each) do
      @account = mock_model(Account, :to_param => "AccountId")

      assigns[:accounts] = [@account]
    end

    it "should show a new entry form" do
      render "/accounts/dashboard.html.erb"
      response.should have_tag("form[id=?]", "new_entry") do
        with_tag("input#entry_description[name=?]", "entry[description]")
        with_tag("input#entry_amount_in_pence[name=?]", "entry[amount_in_pence]")
      end
    end
    
    it "should not show a dropdown menu" do
      @account.should_receive(:id).and_return("AccountId")
      render "/accounts/dashboard.html.erb"
      response.should_not have_tag("select#entry_account_id")
      response.should have_tag("input#entry_account_id[name=?][type=hidden]", "entry[account_id]", :value => "AccountId")
    end
  end

  describe "when there are accounts" do
    before(:each) do
      @account = mock_model(Account)
      @account.stub!(:name).and_return("AccountName")

      assigns[:accounts] = [@account, @account]
    end

    it "should show a new entry form" do
      render "/accounts/dashboard.html.erb"
      response.should have_tag("form[id=?]", "new_entry") do
        with_tag("input#entry_description[name=?]", "entry[description]")
        with_tag("input#entry_amount_in_pence[name=?]", "entry[amount_in_pence]")
      end
    end

    it "should show a dropdown menu" do
      @account.should_receive(:name).and_return("Account One", "Account Two")
      render "/accounts/dashboard.html.erb"
      response.should have_tag("select#entry_account_id") do
        with_tag("option", :text => "Account One")
        with_tag("option", :text => "Account Two")
      end
      response.should_not have_tag("input#entry_account_id[name=?][type=hidden]", "entry[account_id]", :value => "AccountId")
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

