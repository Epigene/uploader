# spring rspec spec/routing/root_routing_spec.rb
RSpec.describe "Root route", type: :routing do

  describe "/" do
    it "should route GET '/' to Uploads#index" do
      expect(get: "/").to route_to(
        controller: "uploads",
        action: "index",
      )
    end
  end

end
