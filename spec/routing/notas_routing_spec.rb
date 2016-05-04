require "spec_helper"

describe NotasController do
  describe "routing" do

    it "routes to #index" do
      get("/notas").should route_to("notas#index")
    end

    it "routes to #new" do
      get("/notas/new").should route_to("notas#new")
    end

    it "routes to #show" do
      get("/notas/1").should route_to("notas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/notas/1/edit").should route_to("notas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/notas").should route_to("notas#create")
    end

    it "routes to #update" do
      put("/notas/1").should route_to("notas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/notas/1").should route_to("notas#destroy", :id => "1")
    end

  end
end
