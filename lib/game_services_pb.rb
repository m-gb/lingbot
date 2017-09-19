# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: game.proto for package ''

require 'grpc'
require 'game_pb'

module LingService
  class Service

    include GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = 'LingService'

    # asks a question
    rpc :lingbot_question, LingQuestionRequest, LingQuestionResponse
    # gives a score
    rpc :lingbot_answer, LingAnswerRequest, LingAnswerResponse
  end

  Stub = Service.rpc_stub_class
end
