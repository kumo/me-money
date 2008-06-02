require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/entries/new.html.erb" do
  include EntriesHelper
  
  before(:each) do
    @entry = mock_model(Entry)
    @entry.stub!(:new_record?).and_return(true)
    @entry.stub!(:description).and_return("MyString")
    @entry.stub!(:paid_on).and_return(Date.today)
    @entry.stub!(:amount_in_pence).and_return("1")
    @entry.stub!(:account_id).and_return("1")
    assigns[:entry] = @entry

    @account = mock_model(Account)
    assigns[:account] = @account
  end

  it "should render new form" do
    render "/entries/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", account_entries_path(@account)) do
      with_tag("input#entry_description[name=?]", "entry[description]")
      with_tag("input#entry_amount_in_pence[name=?]", "entry[amount_in_pence]")
      with_tag("select#entry_account_id[name=?]", "entry[account_id]")
    end
  end

  it "should render drop down list of accounts" do
    @account.should_receive(:name).twice.and_return("AccountName")
    Account.should_receive(:find).and_return([@account, @account])

    render "/entries/new.html.erb"

    response.should have_tag("select#entry_account_id[name=?]", "entry[account_id]") do
      with_tag("option", "AccountName", 2)
    end
  end
end


