class Api::TodosController < ApiController

  def index
    @todos = Todo.all
  end
end
