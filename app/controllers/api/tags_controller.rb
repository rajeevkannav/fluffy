class Api::TagsController < ApplicationController

  ### Callbacks
  before_action :set_tag

  # GET /api/tags/:tag_name/todos
  def todos
    @todos = @tag.todos
  end

  private

  def set_tag
    @tag = Tag.find_by(name: params[:name])
  end

end
