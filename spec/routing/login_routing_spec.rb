# spring rspec spec/routing/login_routing_spec.rb
RSpec.describe "Login routes", type: :routing do

  describe "/login/*" do
    it "routes GET '/login/new' to Login#new" do
      expect(get: "/login/new").to route_to(
        controller: "login",
        action: "new",
      )
    end

    it "routes POST '/login' to Login#create" do
      expect(post: "/login").to route_to(
        controller: "login",
        action: "create",
      )
    end

    it "routes DELETE '/login' to Login#destroy" do
      expect(delete: "/login").to route_to(
        controller: "login",
        action: "destroy",
      )
    end
  end

end
