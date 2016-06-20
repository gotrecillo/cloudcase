class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all.order("created_at DESC")
  end

  def show
    @document = find_document
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(document_params)

    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @document.update
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    if @document.destroy
      redirect_to documents_path
    end
  end

  private

    def find_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :content)
    end

end
