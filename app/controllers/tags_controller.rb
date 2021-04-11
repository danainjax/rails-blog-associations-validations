class TagsController < ApplicationController

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
    
        respond_to do |format|
          if @tag.save
            format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
            format.json { render action: 'show', status: :created, location: @tag }
          else
            format.html { render action: 'new' }
            format.json { render json: @tag.errors, status: :unprocessable_entity }
          end
        end
      end

    def index
        @tags = Tag.all
    end

    def tag_params
        params.require(:tag).permit(:name)
    end
end
