 require 'faker'


 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

# create unique post.
unique_post = "this is unique title"
unique_comment = "this is unique comment"

unless Post.where(title: unique_post).exists?
  Post.create!(
    title: unique_post,
    body: "unqiue post body"
    )
end

posts = Post.all

unless Comment.where(body: unique_comment).exists?
  Comment.create!(
    post: posts.sample,
    body: unique_comment
    )
end
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"