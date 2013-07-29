class RevisionController < ApplicationController
   before_action :set_model, only: [:new]


  def create
    params.permit!
    @revision = Revision.new
    @mesh = Mesh.new(params[:mesh])
    @mesh.format = :DAE
    @mesh.save!

    @revision.model = Model.find(params[:id])
    @revision.mesh = @mesh

    @revision.save!
    redirect_to session[:return_to]

  end

  def new
    session[:return_to] ||= request.referer
    @mesh = Mesh.new
  end

  def set_model
    @model = Model.find(params[:id])
  end
end
