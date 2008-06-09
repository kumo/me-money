require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PiggyBanksController do
  describe "handling GET /piggy_banks" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank)
      PiggyBank.stub!(:find).and_return([@piggy_bank])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all piggy_banks" do
      PiggyBank.should_receive(:find).with(:all).and_return([@piggy_bank])
      do_get
    end
  
    it "should assign the found piggy_banks for the view" do
      do_get
      assigns[:piggy_banks].should == [@piggy_bank]
    end
  end

  describe "handling GET /piggy_banks.xml" do

    before(:each) do
      @piggy_banks = mock("Array of PiggyBanks", :to_xml => "XML")
      PiggyBank.stub!(:find).and_return(@piggy_banks)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all piggy_banks" do
      PiggyBank.should_receive(:find).with(:all).and_return(@piggy_banks)
      do_get
    end
  
    it "should render the found piggy_banks as xml" do
      @piggy_banks.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /piggy_banks/1" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank)
      PiggyBank.stub!(:find).and_return(@piggy_bank)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the piggy_bank requested" do
      PiggyBank.should_receive(:find).with("1").and_return(@piggy_bank)
      do_get
    end
  
    it "should assign the found piggy_bank for the view" do
      do_get
      assigns[:piggy_bank].should equal(@piggy_bank)
    end
  end

  describe "handling GET /piggy_banks/1.xml" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank, :to_xml => "XML")
      PiggyBank.stub!(:find).and_return(@piggy_bank)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the piggy_bank requested" do
      PiggyBank.should_receive(:find).with("1").and_return(@piggy_bank)
      do_get
    end
  
    it "should render the found piggy_bank as xml" do
      @piggy_bank.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /piggy_banks/new" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank)
      PiggyBank.stub!(:new).and_return(@piggy_bank)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new piggy_bank" do
      PiggyBank.should_receive(:new).and_return(@piggy_bank)
      do_get
    end
  
    it "should not save the new piggy_bank" do
      @piggy_bank.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new piggy_bank for the view" do
      do_get
      assigns[:piggy_bank].should equal(@piggy_bank)
    end
  end

  describe "handling GET /piggy_banks/1/edit" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank)
      PiggyBank.stub!(:find).and_return(@piggy_bank)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the piggy_bank requested" do
      PiggyBank.should_receive(:find).and_return(@piggy_bank)
      do_get
    end
  
    it "should assign the found PiggyBank for the view" do
      do_get
      assigns[:piggy_bank].should equal(@piggy_bank)
    end
  end

  describe "handling POST /piggy_banks" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank, :to_param => "1")
      PiggyBank.stub!(:new).and_return(@piggy_bank)
    end
    
    describe "with successful save" do
  
      def do_post
        @piggy_bank.should_receive(:save).and_return(true)
        post :create, :piggy_bank => {}
      end
  
      it "should create a new piggy_bank" do
        PiggyBank.should_receive(:new).with({}).and_return(@piggy_bank)
        do_post
      end

      it "should redirect to the new piggy_bank" do
        do_post
        response.should redirect_to(piggy_bank_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @piggy_bank.should_receive(:save).and_return(false)
        post :create, :piggy_bank => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /piggy_banks/1" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank, :to_param => "1")
      PiggyBank.stub!(:find).and_return(@piggy_bank)
    end
    
    describe "with successful update" do

      def do_put
        @piggy_bank.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the piggy_bank requested" do
        PiggyBank.should_receive(:find).with("1").and_return(@piggy_bank)
        do_put
      end

      it "should update the found piggy_bank" do
        do_put
        assigns(:piggy_bank).should equal(@piggy_bank)
      end

      it "should assign the found piggy_bank for the view" do
        do_put
        assigns(:piggy_bank).should equal(@piggy_bank)
      end

      it "should redirect to the piggy_bank" do
        do_put
        response.should redirect_to(piggy_bank_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @piggy_bank.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /piggy_banks/1" do

    before(:each) do
      @piggy_bank = mock_model(PiggyBank, :destroy => true)
      PiggyBank.stub!(:find).and_return(@piggy_bank)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the piggy_bank requested" do
      PiggyBank.should_receive(:find).with("1").and_return(@piggy_bank)
      do_delete
    end
  
    it "should call destroy on the found piggy_bank" do
      @piggy_bank.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the piggy_banks list" do
      do_delete
      response.should redirect_to(piggy_banks_url)
    end
  end
end
