# -*- coding: utf-8 -*-
module API
  module V1
    module Concerns
      module Sms
        extend ActiveSupport::Concern
        included do
          desc '短信验证码 [POST /sms/sendcode]'
          params do
            requires :phone, type: String, desc: '手机号码'
          end
          post '/sms/sendcode' do
            service = RongCloud::Service.new
            code = rand(999999).to_s
            p code
            phone = params.phone
            $redis.set("_phoneCode"+ phone,code);
            $redis.expire("_phoneCode"+ phone,3600);
            p $redis.get("_phoneCode"+ phone)
            content= "{签名}您的短信验证码是#{code}，请在15分钟内输入使用。超时请重新申请。"
            #service.sendCode(phone, content, "86")
          end
        end
      end
    end
  end
end
