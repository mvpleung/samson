require_relative "spec_helper"

describe "Pusher::jobs" do
  describe "a GET to /jobs" do
    before { get "/jobs" }

    it "should be ok" do
      last_response.should be_ok
    end
  end

  describe "a GET to /jobs/:id" do
    before do
      job = Job.create(:name => "test")
      get "/jobs/#{job.id}"
    end

    it "should be ok" do
      last_response.should be_ok
    end
  end

  describe "a GET to /jobs/new" do
    before { get "/jobs/new" }

    it "should be ok" do
      last_response.should be_ok
    end
  end

  describe "a POST to /jobs" do
    before do
      post "/jobs", params
    end

    describe "valid" do
      let(:params) {{ :job => { :name => "test" }}}

      it "should redirect" do
        last_response.location.should match(%r{/jobs$})
      end
    end

    describe "invalid" do
      let(:params) {{ :job => {} }}

      it "should render" do
        last_response.should be_ok
      end
    end
  end

  describe "a GET to /jobs/:id/execute" do
    before do
      job = Job.create(:name => "test")
      get "/jobs/#{job.id}/execute"
    end

    describe "with websockets" do
      # TODO ......
    end

    describe "without websockets" do
      it "should be ok" do
        last_response.should be_ok
      end
    end
  end
end
