require 'json'
module Api
    module V1
        class ReservationController < ApplicationController
            def index
                begin 
                    @reservation = Reservation.order('created_at DESC')
                    render json: {status: '200', message: 'Successful', data: Reservation.all},status: :ok
                rescue NameError
                    render json: {status: '200', message: 'Successful', data: :null},status: :ok
                end
            end

            def show
                begin
                    @reservation = Reservation.find(params[:id])
                    render json: {status: '200', message: 'Successful', data: reservation},status: :ok
                rescue ActiveRecord::RecordNotFound
                    render json: {status: '200', message: 'Successful', data: 'Record not Found'},status: :ok
                end
            end

            def create
                reservation = Reservation.new(reservation_params)

                if reservation.save
                    render json: {status: '200', message: 'Successful', data:reservation_params}, status: :ok
                else
                    render json: {status: '500', message: 'Unsuccessful', data:reservation.errors}, status: :unprocessable_entity
                end
            end

            private
            
            def reservation_params
                raw_data = JSON.parse(request.body.read)
                data = {}
                if raw_data.key?('reservation')     
                    data["start_date"] = raw_data["reservation"]["start_date"]
                    data["end_date"] = raw_data["reservation"]["end_date"]
                    data["nights"] = raw_data["reservation"]["nights"]
                    data["guests"] = raw_data["reservation"]["guest_details"]["localized_description"]
                    data["adults"] = raw_data["reservation"]["guest_details"]["number_of_adults"]
                    data["children"] = raw_data["reservation"]["guest_details"]["number_of_children"]
                    data["infants"] = raw_data["reservation"]["guest_details"]["number_of_infants"]
                    data["status"] = raw_data["reservation"]["status_type"]
                    data["guest"]["id"] = raw_data["reservation"]["guest_id"]
                    data["guest"]["first_name"] = raw_data["reservation"]["guest_first_name"]
                    data["guest"]["last_name"] = raw_data["reservation"]["guest_last_name"]
                    data["guest"]["email"] = raw_data["reservation"]["guest_email"]
                    data["guest"]["phone"] = raw_data["reservation"]["guest_phone_numbers"]
                    data["currency"] = raw_data["reservation"]["host_currency"]
                    data["payout_price"] = raw_data["reservation"]["expected_payout_amount"]
                    data["security_price"] = raw_data["reservation"]["listing_security_price_accurate"]
                    data["total_price"] = raw_data["reservation"]["total_paid_amount_accurate"]
                else
                    data["start_date"] = raw_data["start_date"]
                    data["end_date"] = raw_data["end_date"]
                    data["nights"] = raw_data["nights"]
                    data["guests"] = raw_data["guests"]
                    data["adults"] = raw_data["adults"]
                    data["children"] = raw_data["children"]
                    data["infants"] = raw_data["infants"]
                    data["status"] = raw_data["status"]
                    data["guest"] = raw_data["guest"]
                    data["currency"] = raw_data["currency"]
                    data["payout_price"] = raw_data["payout_price"]
                    data["security_price"] = raw_data["security_price"]
                    data["total_price"] = raw_data["total_price"]
                    
                end
                p data
            end
        end
    end
end