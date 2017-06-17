# spring rspec spec/routing/uploads_routing_spec.rb
RSpec.describe "Uploads routes", type: :routing do

  describe "/files/*" do
    it "routes GET '/files' to Uploads#index" do
      expect(get: "/files").to route_to(
        controller: "uploads",
        action: "index",
      )
    end

    it "routes GET '/files/new' to Uploads#new" do
      expect(get: "/files/new").to route_to(
        controller: "uploads",
        action: "new",
      )
    end

    it "routes POST '/files' to Uploads#create" do
      expect(post: "/files").to route_to(
        controller: "uploads",
        action: "create",
      )
    end

    it "routes GET '/files/:id' to Uploads#show" do
      expect(get: "/files/1").to route_to(
        controller: "uploads",
        action: "show",
        id: "1"
      )
    end

    it "routes DELETE '/files/:id' to Uploads#destroy" do
      expect(delete: "/files/1").to route_to(
        controller: "uploads",
        action: "destroy",
        id: "1"
      )
    end
  end

end
