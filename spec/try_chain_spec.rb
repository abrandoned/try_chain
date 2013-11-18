require 'spec_helper'

describe ::TryChain do

  context "#proxy_try_chain" do
    it "returns nil when nil given" do
      ::TryChain.proxy_try_chain(nil, :derp, :derp).should be_nil
    end

    it "returns nil when object does not respond to message" do
      mock_it = double(Object)
      ::TryChain.proxy_try_chain(nil, :derp, :derp).should be_nil
    end

    it "returns nil when first level try returns nil" do
      mock_it = double(Object)
      mock_it.stub(:derp) { nil }
      ::TryChain.proxy_try_chain(mock_it, :derp, :derp).should be_nil
    end
  end

  context "#proxy_try_chain!" do
    it "returns nil when nil given" do
      ::TryChain.proxy_try_chain!(nil, :derp, :derp).should be_nil
    end

    it "throws eception when object does not respond to message" do
      mock_it = double(Object)
      expect {
        ::TryChain.proxy_try_chain!(mock_it, :derp, :derp).should be_nil
      }.to raise_error
    end

    it "returns nil when first level try returns nil" do
      mock_it = double(Object)
      mock_it.stub(:derp) { nil }
      ::TryChain.proxy_try_chain!(mock_it, :derp, :derp).should be_nil
    end
  end

end
