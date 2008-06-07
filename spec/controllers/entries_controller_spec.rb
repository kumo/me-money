require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesController do
  describe "handling GET /entries" do

    before(:each) do
      @entry = mock_model(Entry)
      @account = mock_model(Account)
      @account.stub!(:entries).and_return([@entry])
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      get :index, :account_id => "2"
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all entries for the account" do
      @account.should_receive(:entries).and_return([@entry])
      do_get
    end
  
    it "should assign the found entries for the view" do
      do_get
      assigns[:entries].should == [@entry]
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling GET /entries.xml" do

    before(:each) do
      @entries = mock("Array of Entries", :to_xml => "XML")
      @account = mock_model(Account)
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index, :account_id => "2"
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all entries for the account" do
      @account.should_receive(:entries).and_return(@entries)
      do_get
    end
  
    it "should render the found entries as xml" do
      @entries.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling GET /entries/1" do

    before(:each) do
      @entry = mock_model(Entry)
      @entries = mock("Array of Entries")
      @entries.stub!(:find).and_return(@entry)
      @account = mock_model(Account)
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      get :show, :id => "1", :account_id => "2"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the account's requested entry" do
      @entries.should_receive(:find).with("1").and_return(@entry)
      do_get
    end
  
    it "should assign the found entry for the view" do
      do_get
      assigns[:entry].should equal(@entry)
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling GET /entries/1.xml" do

    before(:each) do
      @entry = mock_model(Entry, :to_xml => "XML")
      @entries = mock("Array of Entries")
      @entries.stub!(:find).and_return(@entry)
      @account = mock_model(Account)
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1", :account_id => "2"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the account's requested entry" do
      @entries.should_receive(:find).with("1").and_return(@entry)
      do_get
    end
  
    it "should render the found entry as xml" do
      @entry.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling GET /entries/new" do

    before(:each) do
      @entry = mock_model(Entry)
      @entry.stub!(:account=)
      Entry.stub!(:new).and_return(@entry)
      @account = mock_model(Account)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      get :new, :account_id => "2"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new entry" do
      Entry.should_receive(:new).and_return(@entry)
      do_get
    end
  
    it "should not save the new entry" do
      @entry.should_not_receive(:save)
      do_get
    end
  
    it "should assign the account to the entry" do
      @entry.should_receive(:account=).with(@account)
      do_get
    end
    
    it "should assign the new entry for the view" do
      do_get
      assigns[:entry].should equal(@entry)
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling GET /entries/1/edit" do

    before(:each) do
      @entry = mock_model(Entry)
      @entries = mock("Array of Entries")
      @entries.stub!(:find).and_return(@entry)
      @account = mock_model(Account)
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_get
      get :edit, :id => "1", :account_id => "2"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the account's requested entry" do
      @entries.should_receive(:find).with("1").and_return(@entry)
      do_get
    end
  
    it "should assign the found Entry for the view" do
      do_get
      assigns[:entry].should equal(@entry)
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_get
    end
  
    it "should assign the found account for the view" do
      do_get
      assigns[:account].should equal(@account)
    end
  end

  describe "handling POST /entries" do

    before(:each) do
      @entry = mock_model(Entry, :to_param => "1")
      @entry.stub!(:amount_in_pence).and_return(30)
      Entry.stub!(:new).and_return(@entry)
      @account = mock_model(Account, :to_param => "2")
      @account.stub!(:balance_in_pence).and_return(100)
      @account.stub!(:update_attribute)
      Account.stub!(:find).and_return(@account)
    end
    
    describe "with successful save" do
  
      def do_post
        @entry.should_receive(:save).and_return(true)
        post :create, :entry => {}, :account_id => "2"
      end
  
      it "should create a new entry" do
        Entry.should_receive(:new).with({}).and_return(@entry)
        do_post
      end

      it "should redirect to the list of entries" do
        do_post
        response.should redirect_to(account_entries_url("2"))
      end
      
      it "should find the account requested" do
        Account.should_receive(:find).with("2").and_return(@account)
        do_post
      end

      it "should assign the found account for the view" do
        do_post
        assigns[:account].should equal(@account)
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @entry.should_receive(:save).and_return(false)
        post :create, :entry => {}, :account_id => "2"
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end

    end
  end

  describe "handling PUT /entries/1" do

    before(:each) do
      @entry = mock_model(Entry, :to_param => "1")
      @entries = mock("Array of Entries")
      @entries.stub!(:find).and_return(@entry)
      @account = mock_model(Account, :to_param => "2")
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
    
    describe "with successful update" do

      def do_put
        @entry.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :account_id => "2"
      end

      it "should find the account's requested entry" do
        @entries.should_receive(:find).with("1").and_return(@entry)
        do_put
      end

      it "should update the found entry" do
        do_put
        assigns(:entry).should equal(@entry)
      end

      it "should assign the found entry for the view" do
        do_put
        assigns(:entry).should equal(@entry)
      end

      it "should redirect to the entry" do
        do_put
        response.should redirect_to(account_entry_url("2", "1"))
      end

      it "should find the account requested" do
        Account.should_receive(:find).with("2").and_return(@account)
        do_put
      end

      it "should assign the found account for the view" do
        do_put
        assigns[:account].should equal(@account)
      end

    end
    
    describe "with failed update" do

      def do_put
        @entry.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1", :account_id => "2"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /entries/1" do

    before(:each) do
      @entry = mock_model(Entry, :destroy => true)
      @entries = mock("Array of Entries")
      @entries.stub!(:find).and_return(@entry)
      @account = mock_model(Account, :to_param => "2")
      @account.stub!(:entries).and_return(@entries)
      Account.stub!(:find).and_return(@account)
    end
  
    def do_delete
      delete :destroy, :id => "1", :account_id => "2"
    end

    it "should find the account's requested entry" do
      @entries.should_receive(:find).with("1").and_return(@entry)
      do_delete
    end
  
    it "should call destroy on the found entry" do
      @entry.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the entries list" do
      do_delete
      response.should redirect_to(account_entries_url("2"))
    end

    it "should find the account requested" do
      Account.should_receive(:find).with("2").and_return(@account)
      do_delete
    end
  
    it "should assign the found account for the view" do
      do_delete
      assigns[:account].should equal(@account)
    end
  end
end
