require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/entries/show.html.erb" do
  include EntriesHelper
  
  before(:each) do
    @entry = mock_model(Entry)
    @entry.stub!(:description).and_return("MyString")
    @entry.stub!(:paid_on).and_return(Date.today)
    @entry.stub!(:amount_in_pence).and_return("1")
    @entry.stub!(:account_id).and_return("1")

    assigns[:entry] = @entry
    
    @account = mock_model(Account)
    assigns[:account] = @account
  end

  it "should render attributes in <p>" do
    render "/entries/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

