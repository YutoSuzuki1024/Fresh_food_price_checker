class MembersController < ApplicationController
	before_action :authenticate_member!

  def show
    binding.pry
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "会員情報が変更できました！"
      redirect_to member_path(@member.id)
    else
      render "edit"
    end
  end



  def leave
  end

  def out
  	@member = Member.find(current_member.id)
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのお越しをお待ちしております！"
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :sex, :age, :address)
  end
end
