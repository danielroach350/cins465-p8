class FishController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  before_action :set_fish, only: [:show, :edit, :update, :destroy]
  # GET /fish
  # GET /fish.json
  def index
		@user = User.find(current_user)
		if Fish.exists?(current_user.id)
			@fish = @user.fish
		else
		puts "nothing"
		end
		@hash = Gmaps4rails.build_markers(@fish) do |fish, marker|
  	marker.lat fish.latitude
  	marker.lng fish.longitude
		marker.infowindow "Fish #{fish.id}\nType Caught #{fish.fish_type}\nLength #{fish.fish_length}\nWeight #{fish.fish_weight}\nCaught on #{fish.caught_on}"
		end
  end
	def image_convert(fish_id)
		puts "jhsahjghsgadsgh"
		puts fish_id
		if params[:fish][:fish_photo]
			pixels = hex_to_string(params[:fish][:fish_photo])
			data = StringIO.new(pixels)
			data.class.class_eval { attr_accessor :original_filename, :content_type }
    	data.original_filename = "fish#{fish_id}.jpeg"
    	data.content_type = "image/jpeg"
				
  		File.open(Rails.root.join('public', 'assets', data.original_filename), 'wb') do |file|
    		file.write(data.read)
			end
		end
	end
	#converts the data from hex to a string -> found code here http://4thmouse.com/index.php/2008/02/18/converting-hex-to-binary-in-4-languages/
  def hex_to_string(hex)
 	temp = hex.gsub("\s", "");
    ret = []
    (0...temp.size()/2).each{|index| ret[index] = [temp[index*2, 2]].pack("H2")}
    file = String.new
    ret.each { |x| file << x}
    file  
  end

  # GET /fish/1
  # GET /fish/1.json
  def show
		puts "pic" *10
		puts @fish.fish_photo
		@note = Note.new
		@note.fish_id = @fish.id
		@weathers = @fish.weathers
		@notes = @fish.notes
		@fishWeather =  @weathers[0]
		@notes.each do |n|
		puts n
		end
  end

	def upload
		file = params[:Photo]
		@user = User.find(current_user.id)
		@user.first_name = params[:first_name]
		@user.last_name =params[:last_name]
		@user.photo = file.original_filename
		uploaded_io = file
  	File.open(Rails.root.join('public', 'assets', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
  	end
		if @user.save
    	respond_to do |format|
      	if @user.save
        	format.html { redirect_to root_url, notice: 'Photo was uploaded successfully' }
      	else
        	format.html { render action: 'fish' }
        	format.json { render json: @user.errors, status: :unprocessable_entity }
     	 	end
    	end
		end

	end
	def user_photo
		@user = User.find(current_user)
	end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish
  # POST /fish.json
  def create
    @fish = Fish.new(fish_params)
		@user = User.find_by email: params[:user][:email]
		@fish.user_id = @user.id
		if @fish.save
			@fish.fish_photo = "fish#{@fish.id}.jpeg"
			@fish.save
			image_convert(@fish.id)
    	@weather = @fish.weathers.create(weather_params)
    	respond_to do |format|
      	if @weather.save
        	format.html { redirect_to @fish, notice: 'Fish was successfully created.' }
        	format.json { render action: 'show', status: :created, location: @fish }
      	else
        	format.html { render action: 'new' }
        	format.json { render json: @fish.errors, status: :unprocessable_entity }
      	end
    	end
		end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fish_params
      params.require(:fish).permit(:user_id, :fish_type, :fish_length, :fish_weight, :caught_on, :longitude, :latitude, :caught_date, :fish_photo)
    end
		def weather_params
			params.require(:weather).permit(:weather_info, :currentTime, :moonPercentage,  :location,  :zipCode, :elevation, :observationLocation, :observationLocationElevation, :observationTime, :currentWeather, :temperature, :relative_humidity, :windInformation, :precipToday)
		end

end
