module AuthenticationRoles
  extend ActiveSupport::Concern

  included do
    private

    def role_head_manager
      return if current_user.role.role == 'head_manager'

      flash[:info] = 'Действие доступно только Начальника цеха'
      redirect_to(root_path)
    end

  end

end
