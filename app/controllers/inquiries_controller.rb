class InquiriesController < ApplicationController
  def new
  end

  def confirm
  	@inquiry = Inquiry.new
  	@inquiry.name = params[:name]
  	@inquiry.email = params[:email]
  	@inquiry.body = params[:body]
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)
  	if @inquiry.save
  		#お問い合わせメールが送信されるようにする
  		InquiryMailer.received_email(@inquiry).deliver
  		redirect_to inquiries_complete_path
  	else
  		render 'inquiries/confirm'
  	end
  end

  def complete
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :body)
  end
end
