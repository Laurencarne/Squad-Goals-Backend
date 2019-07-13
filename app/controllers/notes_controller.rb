class NotesController < ApplicationController

  def my_notes
    if logged_in
      render json: Flatmate.find(current_flatmate[:id]).notes
    else
      render json: {error: "Notes not available."}
    end
  end

  def create
    note = Note.create(note_params)
    render json: note
  end

  private
  def note_params
    params.require(:note).permit(:note, :flatmate_id)
  end

end
