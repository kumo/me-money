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
    end
  end
end


