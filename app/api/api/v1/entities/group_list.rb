# frozen_string_literal: true

module API
  module V1
    module Entities
      class GroupList < Grape::Entity
        expose :id, :name
      end
    end
  end
end
