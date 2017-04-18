class MetadataController < ApplicationController
  before_action :set_metadatum, only: [:show, :edit, :update, :destroy]

  # GET /metadata
  def index
    @metadata = Metadatum.all
  end

  # GET /metadata/1
  def show
  end

  # GET /metadata/new
  def new
    @metadatum = Metadatum.new
  end

  # GET /metadata/1/edit
  def edit
  end

  # POST /metadata
  def create
    @metadatum = Metadatum.new(metadatum_params)

    if @metadatum.save
      redirect_to @metadatum, notice: 'Metadatum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /metadata/1
  def update
    if @metadatum.update(metadatum_params)
      redirect_to @metadatum, notice: 'Metadatum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /metadata/1
  def destroy
    @metadatum.destroy
    redirect_to metadata_url, notice: 'Metadatum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metadatum
      @metadatum = Metadatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metadatum_params
      params.require(:metadatum).permit(:entry_id, :meta_rule_id, :value)
    end
end
