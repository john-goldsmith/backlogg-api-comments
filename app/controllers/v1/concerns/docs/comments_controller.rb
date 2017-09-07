module V1

  module Concerns

    module Docs

      module CommentsController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_path '/' do

            operation :get do
              key :summary, 'Get all comments for a specific user'
              key :description, 'Get all comments for a specific user'
              key :operationId, 'getAllComments'
              key :produces, [
                'application/vnd.api+json'
              ]
              key :tags, [
                'comment'
              ]
              parameter do
                key :name, :user_id
                key :in, :query
                key :description, 'User ID'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataArray
                end
              end
            end

            operation :post do
              key :summary, 'Create a new comment'
              key :description, 'Creates a new comment and returns the newly created comment'
              key :operationId, 'createComment'
              key :tags, [
                'comment'
              ]
              parameter do
                key :name, :comment
                key :in, :body
                key :description, 'Comment'
                key :required, true
                key :type, :object
                schema do
                  key :'$ref', :CreateOrModifyParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 422 do
                key :description, 'Unprocessable entity'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

          swagger_path '/{id}' do

            operation :get do
              key :summary, 'Get a specific comment'
              key :description, 'Get a specific comment'
              key :operationId, 'getComment'
              key :tags, [
                'comment'
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, 'ID of comment to fetch'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

            operation :put do
              key :summary, 'Update a specific comment'
              key :description, 'Update a specific comment'
              key :operationId, 'updateComment'
              key :tags, [
                'comment'
              ]
              parameter do
                key :name, :comment
                key :in, :body
                key :description, 'Comment'
                key :required, true
                key :type, :object
                schema do
                  key :'$ref', :CreateOrModifyParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 400 do
                key :description, 'Bad request'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

            operation :delete do
              key :summary, 'Delete a specific comment'
              key :description, 'Delete a specific comment'
              key :operationId, 'deleteUser'
              key :tags, [
                'comment'
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, 'ID of comment to delete'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 204 do
                key :description, 'No content'
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

        end

      end

    end

  end

end