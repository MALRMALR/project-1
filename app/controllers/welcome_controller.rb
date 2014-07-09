class WelcomeController < ApplicationController

  def index
    @random_post = Post.all.sample
  end

end
