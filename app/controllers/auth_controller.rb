class AuthController < ApplicationController

  def create
    flatmate = Flatmate.find_by(username: params[:username])
    if flatmate && flatmate.authenticate(params[:password])
      payload = {flatmate_id: flatmate.id}
      token = issue_token(payload)
      render json: { jwt: token, user: flatmate.username}
    else
      render json: { error: "The token couldn't be created. Login failed."}
    end
  end

  def show
    if has_flat
      render json: current_flatmate, except: [:created_at, :updated_at, :password_digest],
      include: [
        {
          :flat => {
            except: [:created_at, :updated_at, :flat_id]
          },
          :notes => {
            except: [:created_at, :updated_at, :flatmate_id]
          },
          :events => {
            except: [:created_at, :updated_at, :flatmate_id]
          },
          :tasks => {
            except: [:created_at, :updated_at, :flat_id]
          },
          :items => {
            except: [:created_at, :updated_at, :shopping_list_id]
          }
        }
      ]
    elsif logged_in
      render json: current_flatmate, except: [:created_at, :updated_at, :password_digest],
      include: [
        {
          :notes => {
            except: [:created_at, :updated_at, :flatmate_id]
          },
          :events => {
            except: [:created_at, :updated_at, :flatmate_id]
          }
        }
      ]
    else
      render json: {error: "Data Not Avaliable"}
    end
  end

  def move_in
    if current_flatmate.id === params[:id].to_i
      id_flat = Flat.find_by(flat_key: params[:flat_key])
      current_flatmate.update(flat_id: id_flat.id)
      render json: current_flatmate, except: [:created_at, :updated_at, :password_digest, :email]
    else
      render json: {error: "Data Not Avaliable"}
    end
  end

end
