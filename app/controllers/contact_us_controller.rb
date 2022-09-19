class ContactUsController < ApplicationController
  def index
    contact_messages = ContactMessage.all
    render json: contact_messages, status: :ok
  end

  def create
    contact_message = ContactMessage.create(contact_message_params)
    contact_message.save!
    render json: contact_message, status: :created
  rescue StandardError => e
    head(:unprocessable_entity)
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(
      :email,
      :name,
      :message
    )
  end
end
