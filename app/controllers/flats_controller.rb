class FlatsController < ApplicationController
  before_action :validate_flat, except: [:create]

  def index
    flat = Flatmate.find(current_flatmate[:id]).flat
    render json: flat, except: [:created_at, :updated_at, :flat_key],
    include: [
      {
        :shopping_list => {
          except: [:created_at, :updated_at, :flat_id],
          include: [
            {
              :items => {
                except: [:updated_at, :created_at, :shopping_list_id]
              }
            }
          ]
        },
        :tasks => {
          except: [:updated_at, :created_at, :flat_id]
        },
        :events => {
          except: [:updated_at, :created_at]
        }
      }
    ]
  end

  def show
    user = current_flatmate
    flat = Flat.find_by(id: params[:id])
    if flat.id === user.flat_id
      render json: flat, except: [:created_at, :updated_at, :flat_key],
      include: [
        {
          :shopping_list => {
            except: [:created_at, :updated_at, :flat_id],
            include: [
              {
                :items => {
                  except: [:updated_at, :created_at, :shopping_list_id]
                }
              }
            ]
          },
          :tasks => {
            except: [:updated_at, :created_at, :flat_id]
          },
          :events => {
            except: [:updated_at, :created_at]
          }
        }
      ]
    else
      render json: {error: "Data Not Avaliable"}
    end
  end

  def create
    if logged_in && !current_flatmate.flat_id
      flat = Flat.new(flat_params)
      if flat.save
        current_flatmate.update(flat_id: flat.id)
        Calender.create(flat_id: flat.id, id: flat.id)
        ShoppingList.create(flat_id: flat.id, id: flat.id)
        render json: flat
      else
        render json: {error: "Flat not created."}
      end
    end
  end

  def update
    flat = current_flatmate.flat
    if flat
      flat.update(flat_params)
      render json: flat
    else
      render json: {error: "Update Unsuccessful"}
    end
  end

  def destroy
    flat = current_flatmate.flat
    if flat
      flat.destroy
      current_flatmate.update(flat_id: nil)
      render json: {message: "Flat Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

private

  def flat_params
    params.require(:flat).permit(:name, :flat_key, :calender_id, :shoppinglist_id, :address_one, :address_two, :city, :postcode)
  end

end
