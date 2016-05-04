require "spec_helper"

describe InscricoesController do
  describe "routing" do

    it "routes to #index" do
      get("/inscricoes").should route_to("inscricoes#index")
    end

    it "routes to #new" do
      get("/inscricoes/new").should route_to("inscricoes#new")
    end

    it "routes to #show" do
      get("/inscricoes/1").should route_to("inscricoes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inscricoes/1/edit").should route_to("inscricoes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inscricoes").should route_to("inscricoes#create")
    end

    it "routes to #update" do
      put("/inscricoes/1").should route_to("inscricoes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inscricoes/1").should route_to("inscricoes#destroy", :id => "1")
    end

  end
end
