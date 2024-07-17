module AuthenticationRoles
  extend ActiveSupport::Concern

  included do
    private

    def role_check(level_accept)
          return if level_accept.include?(current_user.role.number)

          flash[:info] = 'У вас нет доступа'
          redirect_to(root_path)
    end


    def role_head_manager
      return if current_user.role.number >= 3

      flash[:info] = 'У вас нет доступа'
      redirect_to(root_path)
    end
  end
end
