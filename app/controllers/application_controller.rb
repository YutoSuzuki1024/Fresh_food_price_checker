class ApplicationController < ActionController::Base
	#会員登録時に使用するカラムを追加
	before_action :configure_permitted_parameters, if: :devise_controller?

	#ログイン後、トップページへ(会員トップ、管理者トップそれぞれ場合分け)
	def after_sign_in_path_for(resource)
		case resource
		when Member
			member_path(resource)
		else
			admin_root_path
		end
	end

	#ログアウト後、トップページへ(会員トップ、管理者トップそれぞれ場合分け)
	def after_sign_out_path_for(resource)
		case resource
		when :member
			root_path
		else
			admin_root_path
		end
	end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :age, :area_id])
	end
end
