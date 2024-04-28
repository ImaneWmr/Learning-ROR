class MaTablesController < ApplicationController
  before_action :set_ma_table, only: %i[ show edit update destroy ]

  # GET /ma_tables or /ma_tables.json
  def index
    @ma_tables = MaTable.all
  end

  # GET /ma_tables/1 or /ma_tables/1.json
  def show
  end

  # GET /ma_tables/new
  def new
    @ma_table = MaTable.new
  end

  # GET /ma_tables/1/edit
  def edit
  end

  # POST /ma_tables or /ma_tables.json
  def create
    @ma_table = MaTable.new(ma_table_params)

    respond_to do |format|
      if @ma_table.save
        format.html { redirect_to ma_table_url(@ma_table), notice: "Ma table was successfully created." }
        format.json { render :show, status: :created, location: @ma_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ma_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ma_tables/1 or /ma_tables/1.json
  def update
    respond_to do |format|
      if @ma_table.update(ma_table_params)
        format.html { redirect_to ma_table_url(@ma_table), notice: "Ma table was successfully updated." }
        format.json { render :show, status: :ok, location: @ma_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ma_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ma_tables/1 or /ma_tables/1.json
  def destroy
    @ma_table.destroy!

    respond_to do |format|
      format.html { redirect_to ma_tables_url, notice: "Ma table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #nouvelle methode 
  
  def generate_pdf
    @data = MaTable.all
      
    html = render_to_string template: "pdf/table", formats: :html
      
    pdf = WickedPdf.new.pdf_from_string(html)
      
    file_name = "table_export_#{DateTime.now.strftime('%Y%m%d%H%M%S')}.pdf"
    save_path = Rails.root.join("public/export", file_name)
      
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
      
    redirect_to "/export/#{file_name}", notice: t('download_link_will_be_sent_to_your_email')
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ma_table
      @ma_table = MaTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ma_table_params
      params.require(:ma_table).permit(:name, :age, :description)
    end
end
