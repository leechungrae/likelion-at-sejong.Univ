class PageController < ApplicationController
    def home
        
    end
    
    def index
         @posts = Post.all.reverse
    end
  
    def write
        post = Post.create(title: params[:title], content: params[:content])
    
        if post.save
        redirect_to '/page/index'
        else
        render text: post.errors.messages[:title].first
         end
    end
  
    def reply_write
        post = Reply.create(content: params[:content], post_id: params[:id_of_post])
        
        post.save
        redirect_to '/page/index'
    end
    
end
