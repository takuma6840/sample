class CtalogsController < ApplicationController
  def index
    @content = Content.all
  end
end
