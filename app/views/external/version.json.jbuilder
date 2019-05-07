# frozen_string_literal: true

json.version do
  json.string LoudAndLisa::VERSION::STRING
  json.major LoudAndLisa::VERSION::MAJOR
  json.minor LoudAndLisa::VERSION::MINOR
  json.tiny LoudAndLisa::VERSION::TINY
  json.build LoudAndLisa::VERSION::BUILD
end
