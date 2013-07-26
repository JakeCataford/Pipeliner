class ModelController < ApplicationController
  before_action :set_model, only: [:show]

  def show
    @revisions = Revision.find_all_by_model_id(@model.id, :order => :created_at)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model)
    end
end
