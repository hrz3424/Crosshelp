# -*- coding: utf-8 -*-
module API
  module V1
    module Entities
      class JobList < Grape::Entity
        expose :id, :name, :parent_id ,:level
      end
    end
  end
end
