require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/entries/edit.html.erb" do
  include EntriesHelper
  
  before do
    @entry = mock_model(Entry)
    @entry.stub!(:description).and_return("MyString")
    @entry.stub!(:paid_on).and_return(Date.today)
    @entry.stub!(:amount_in_pence).and_return("1")
    @entry.stub!(:account_id).and_return("1")
    assigns[:entry] = @entry

    @account = mock_model(Account)
    assigns[:account] = @account
  end

  it "should render edit form" do
    render "/entries/edit.html.erb"
    
    response.should have_tag("form[action=#{account_entry_path(@account, @entry)}][method=post]") do
      with_tag('input#entry_description[name=?]', "entry[description]")
      with_tag('input#entry_amount_in_pence[name=?]', "entry[amount_in_pence]")
    end
  end
end


