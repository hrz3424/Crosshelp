# frozen_string_literal: true

module API
  module V1
    module Entities
      class FriendshipList < Grape::Entity
        expose :id, :name, :user_id, :friend_id, :state
      end
    end
  end
end
