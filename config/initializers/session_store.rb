# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_www_loudandlisa_com_session',
                                                      secure: Rails.env.production?
