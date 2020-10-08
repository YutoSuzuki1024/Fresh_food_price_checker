class MembersController < ApplicationController
	before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
    @area = Area.find(@member.area_id)

    #アクセス制限
    if current_member.id != @member.id
      redirect_to root_path
    end
  end

  def edit
    @member = Member.find(params[:id])

    #アクセス制限
    if current_member.id != @member.id
      redirect_to root_path
    end
  end

  def update
  	@member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "会員情報が変更できました！"
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
    flash[:notice] = "ご利用ありがとうございました。またのご利用をお待ちしております！"
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :sex, :age, :area_id)
  end
end
