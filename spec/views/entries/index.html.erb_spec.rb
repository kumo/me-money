require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/entries/index.html.erb" do
  include EntriesHelper
  
  before(:each) do
    entry_98 = mock_model(Entry)
    entry_98.should_receive(:description).and_return("EntryDescription")
    entry_98.should_receive(:paid_on).and_return(Date.today)
    entry_98.should_receive(:amount_in_pence).and_return("1")
    entry_99 = mock_model(Entry)
    entry_99.should_receive(:description).and_return("EntryDescription")
    entry_99.should_receive(:paid_on).and_return(Date.today)
    entry_99.should_receive(:amount_in_pence).and_return("1")

    assigns[:entries] = [entry_98, entry_99]

    @account = mock_model(Account)
    @account.should_receive(:name).and_return("AccountName")
    assigns[:account] = @account
  end

  it "should render list of entries" do
    render "/entries/index.html.erb"
    response.should have_text(/AccountName/)
    response.should have_tag("tr>td", "EntryDescription", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

