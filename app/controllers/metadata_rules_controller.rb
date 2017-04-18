class MetadataRulesController < ApplicationController
  before_action :set_metadata_rule, only: [:show, :edit, :update, :destroy]

  # GET /metadata_rules/1
  def show
  end

  # GET /metadata_rules/new
  def new
    @metadata_rule = MetadataRule.new
    @platform = Platform.find(params[:platform_id])
  end

  # GET /metadata_rules/1/edit
  def edit
  end

  # POST /metadata_rules
  def create
    @metadata_rule = MetadataRule.new(metadata_rule_params)
    @metadata_rule.platform = Platform.find(params[:platform_id])

    if @metadata_rule.save
      redirect_to @metadata_rule.platform, notice: 'Metadata rule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /metadata_rules/1
  def update
    if @metadata_rule.update(metadata_rule_params)
      redirect_to @metadata_rule.platform, notice: 'Metadata rule was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /metadata_rules/1
  def destroy
    @metadata_rule.destroy
    redirect_to metadata_rules_url, notice: 'Metadata rule was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metadata_rule
      @metadata_rule = MetadataRule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metadata_rule_params
      params.require(:metadata_rule).permit(:platform_id, :name, :regex, :xpath, :css)
    end
end
