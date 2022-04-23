class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy versions]
  before_action :set_version, only: %i[version revert]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show; end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit; end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /customers/:id/versions
  def versions
    @customers = @customer.versions
  end

  # GET /customers/:id/versions/:id
  def version; end

  # POST /customers/:id/revert/:version_id
  def revert
    @reverted_customer = @version.reify
    if @reverted_customer.save
      redirect_to versions_customer_path(@version.item_id), notice: "Customer was successfully reverted."
    else
      render version
    end
  end

  # GET /customers/deleted
  def deleted
    @destroyed_versions = PaperTrail::Version.where(item_type: "Customer", event: "destroy").order(created_at: :desc)
    @latest_destroyed_versions = @destroyed_versions.filter { |v| v.reify.versions.last.event == "destroy" }.map(&:reify).uniq(&:id)
    @customers = @latest_destroyed_versions
  end

  # POST /customers/:id/restore
  def restore
    @latest_version = Customer.new(id: params[:id]).versions.last
    if @latest_version.event == "destroy"
      @customer = @latest_version.reify
      if @customer.save
        redirect_to @customer, notice: "Customer was successfully restored."
      else
        render "deleted"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_version
      @version = PaperTrail::Version.find_by(item_id: params[:id], id: params[:version_id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :birthday, :country)
    end
end
