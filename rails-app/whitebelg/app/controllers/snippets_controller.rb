class SnippetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @snippets = Snippet.all
  end
end
