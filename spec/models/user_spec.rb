require 'rails_helper'
include TestFactories

 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end

     it "returns `nil` if the user has not favorited the post" do
        expect( @user.favorited(@post).nil? ).to eq(true)
     end
 
     it "returns the appropriate favorite if it exists" do
        @favorite = @user.favorites.build(post: @post)
        @favorite.save
        expect( @user.favorited(@post).nil? ).to eq(false)
     end

     it "returns `nil` if the user has favorited another post" do
        @favorite = @user.favorites.build(post: @post)
        @favorite.save
        @post2 = associated_post
        
        expect( @user.favorited(@post2).nil? ).to eq(true)
    end
   end
 end