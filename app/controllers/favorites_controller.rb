class FavoritesController < ApplicationController
  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
 
     if favorite.save
        flash[:notice] = "favorite was save."
        redirect_to [post.topic, post]
     else
       # Add code to generate a failure flash and redirect to post
        flash[:error] = "cant add favorite, please try again."
        redirect_to [post.topic, post]
     end
  end

   def destroy
   post = Post.find(params[:post_id])
   favorite = current_user.favorites.find(params[:id])
 
   if favorite.destroy
      flash[:notice] = "favorite was delete."
      redirect_to [post.topic, post]
   else
      flash[:error] = "cant delete favorite, please try again."
      redirect_to [post.topic, post]
   end
 end
end
