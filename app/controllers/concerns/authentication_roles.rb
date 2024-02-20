module AuthenticationRoles
  extend ActiveSupport::Concern

  included do
    private

    def role_head_manager
      return if current_user.role.role == 'head_manager'

      flash[:info] = 'Действие доступно только Начальнику цеха'
      redirect_to(users_path)
    end

  end

end
