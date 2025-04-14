require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:user) { User.create(email_address: "test@example.com", username: "tester", password: "password123") }
  let(:recipe) {
    Recipe.create(title: "Sample Recipe", ingredients: "Salt, Oil", instructions: "Mix together", user: user)
  }
  let(:valid_attributes) {
    { title: "New Recipe", ingredients: "Flour, Eggs", instructions: "Bake it" }
  }
  let(:invalid_attributes) {
    { title: "", ingredients: "", instructions: "" }
  }

  context "when signed in" do
    before do
      post session_path, params: { email_address: user.email_address, password: "password123" }
    end

    describe "GET /recipes" do
      it "gets index" do
        get recipes_path
        expect(response).to be_ok
      end
    end

    describe "GET /recipes/:id" do
      it "gets the recipe" do
        get recipe_path(recipe)
        expect(response).to be_ok
      end
    end

    describe "GET /recipes/new" do
      it "gets new" do
        get new_recipe_path
        expect(response).to be_ok
      end
    end

    describe "POST /recipes" do
      it "creates a recipe with valid attributes" do
        expect {
          post recipes_path, params: { recipe: valid_attributes.merge(user_id: user.id) }
        }.to change(Recipe, :count).by(1)
        expect(response).to redirect_to(recipe_path(Recipe.last))
      end

      it "does not create a recipe with invalid attributes" do
        expect {
          post recipes_path, params: { recipe: invalid_attributes }
        }.not_to change(Recipe, :count)
        expect(response).to render_template(:new)
      end
    end

    describe "GET /recipes/:id/edit" do
      it "gets edit" do
        get edit_recipe_path(recipe)
        expect(response).to be_ok
      end
    end

    describe "PATCH /recipes/:id" do
      it "updates with valid attributes" do
        patch recipe_path(recipe), params: { recipe: { title: "Updated" } }
        recipe.reload
        expect(recipe.title).to eq("Updated")
        expect(response).to redirect_to(recipe_path(recipe))
      end

      it "does not update with invalid attributes" do
        patch recipe_path(recipe), params: { recipe: { title: "" } }
        recipe.reload
        expect(recipe.title).not_to eq("")
        expect(response).to render_template(:edit)
      end
    end

    describe "DELETE /recipes/:id" do
      it "deletes the recipe" do
        recipe_to_delete = Recipe.create(title: "Temp", ingredients: "Test", instructions: "Test", user: user)
        expect {
          delete recipe_path(recipe_to_delete)
        }.to change(Recipe, :count).by(-1)
        expect(response).to redirect_to(recipes_path)
      end
    end
  end

  context "when not signed in" do
    describe "GET /recipes" do
      it "redirects to login" do
        get recipes_path
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET /recipes/:id" do
      it "redirects to login" do
        get recipe_path(recipe)
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET /recipes/new" do
      it "redirects to login" do
        get new_recipe_path
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST /recipes" do
      it "does not create recipe with valid attributes" do
        expect {
          post recipes_path, params: { recipe: valid_attributes }
        }.not_to change(Recipe, :count)
        expect(response).to redirect_to(new_session_path)
      end

      it "does not create recipe with invalid attributes" do
        expect {
          post recipes_path, params: { recipe: invalid_attributes }
        }.not_to change(Recipe, :count)
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET /recipes/:id/edit" do
      it "redirects to login" do
        get edit_recipe_path(recipe)
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PATCH /recipes/:id" do
      it "does not update the recipe" do
        patch recipe_path(recipe), params: { recipe: { title: "Hacked" } }
        recipe.reload
        expect(recipe.title).not_to eq("Hacked")
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE /recipes/:id" do
      it "does not delete the recipe" do
        recipe_to_delete = Recipe.create(title: "Temp", ingredients: "Test", instructions: "Test", user: user)
        expect {
          delete recipe_path(recipe_to_delete)
        }.not_to change(Recipe, :count)
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
