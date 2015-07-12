module API
  module V1
    class SubjectsController < ApplicationController

      layout false

      # GET /subjects
      def index
        subjects = Subject.order("position ASC")
        render json: subjects, status: 200
      end

      # GET /subjects/1
      def show
        @subject = Subject.find(params[:id])
      end

      # GET /subjects/new
      def new
        @subject = Subject.new({:name => 'Default'})
      end

      # POST /subjects
      def create
        # Instantiate a new object using form parameters
        @subject = Subject.new(subject_params)

        # Save the object
        if @subject.save
          # If save succeeds, redirect to the index action
          flash[:notice] = 'Subject created successfully'
          redirect_to(:action => 'index')
        else
          # If save fails, redisplay the form so user can fix problems
          render('new')
        end
      end

      # GET /subjects/1/edit
      def edit
        @subject = Subject.find(params[:id])
      end

      # PATCH/PUT /subjects/1
      def update
        # Find an existing object using form parameters
        @subject = Subject.find(params[:id])

        # Update the object
        if @subject.update_attributes(subject_params)
          # If update succeeds, redirect to the index action
          flash[:notice] = 'Subject updated successfully'
          redirect_to(:action => 'show', :id => @subject.id)
        else
          # If update fails, redisplay the form so user can fix problems
          render('edit')
        end
      end

      # GET /subjects/1/delete
      def delete
        @subject = Subject.find(params[:id])
      end

      # DELETE /subjects/1
      def destroy
        subject = Subject.find(params[:id]).destroy
        flash[:notice] = "Subject '#{subject.name}' deleted successfully"
        redirect_to(:action => 'index')
      end

      private

        def subject_params
          # same as using "params[:subject]", except that it:
          # - raises an error if :subject is not present
          # - allows listed attributes to be mass-assigned
          params.require(:subject).permit(:name, :position, :visible)
        end
    end
  end
end
