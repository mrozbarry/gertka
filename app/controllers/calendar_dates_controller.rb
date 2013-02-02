class CalendarDatesController < ApplicationController
  # GET /calendar_dates
  # GET /calendar_dates.json
  def index
    @calendar_dates = CalendarDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calendar_dates }
    end
  end

  # GET /calendar_dates/1
  # GET /calendar_dates/1.json
  def show
    @calendar_date = CalendarDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calendar_date }
    end
  end

  # GET /calendar_dates/new
  # GET /calendar_dates/new.json
  def new
    @calendar_date = CalendarDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calendar_date }
    end
  end

  # GET /calendar_dates/1/edit
  def edit
    @calendar_date = CalendarDate.find(params[:id])
  end

  # POST /calendar_dates
  # POST /calendar_dates.json
  def create
    @calendar_date = CalendarDate.new(params[:calendar_date])

    respond_to do |format|
      if @calendar_date.save
        format.html { redirect_to @calendar_date, notice: 'Calendar date was successfully created.' }
        format.json { render json: @calendar_date, status: :created, location: @calendar_date }
      else
        format.html { render action: "new" }
        format.json { render json: @calendar_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_dates/1
  # PUT /calendar_dates/1.json
  def update
    @calendar_date = CalendarDate.find(params[:id])

    respond_to do |format|
      if @calendar_date.update_attributes(params[:calendar_date])
        format.html { redirect_to @calendar_date, notice: 'Calendar date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calendar_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_dates/1
  # DELETE /calendar_dates/1.json
  def destroy
    @calendar_date = CalendarDate.find(params[:id])
    @calendar_date.destroy

    respond_to do |format|
      format.html { redirect_to calendar_dates_url }
      format.json { head :no_content }
    end
  end
end
