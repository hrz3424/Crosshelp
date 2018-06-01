# frozen_string_literal: true

Trestle.resource(:users) do
  menu do
    item :users, icon: 'fa fa-users', label: '用户'
  end
  remove_action :new

end
