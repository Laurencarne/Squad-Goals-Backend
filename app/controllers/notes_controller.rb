class NotesController < ApplicationController
  before_action :validate_logged_in

  def my_notes
    note = Flatmate.find(current_flatmate[:id]).notes
      render json: note, except: [:updated_at, :created_at, :flatmate_id]
  end

  def create
    note = Note.create(note_params)
    render json: note
  end

  def destroy
    note = current_flatmate.notes.select { |note| note.id === params[:id].to_i}
    if note.length > 0
      note[0].destroy
      render json: {message: "Note Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

  private
  def note_params
    params.require(:note).permit(:note, :flatmate_id)
  end

end
