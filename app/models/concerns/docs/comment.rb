# module Concerns

  module Docs

    module Comment

      extend ActiveSupport::Concern

      included do

        include Swagger::Blocks

        swagger_schema :Comment do
          key :required, [:body, :user_id]
          property :body do
            key :type, :string
          end
          property :user_id do
            key :type, :string
          end
          property :created_at do
            key :type, :string
          end
          property :updated_at do
            key :type, :string
          end
        end

        swagger_schema :CreateOrModifyParameters do
          key :required, :comment
          property :comment do
            key :type, :object
            property :body do
              key :type, :string
            end
            property :user_id do
              key :type, :string
            end
          end
        end

        swagger_schema :JsonApiDataObject do
          property :data do
            key :type, :object
            property :attributes do
              key :type, :object
              key :'$ref', :Comment
            end
            property :id do
              key :type, :string
            end
            property :type do
              key :type, :string
            end
          end
        end

        swagger_schema :JsonApiDataArray do
          property :data do
            key :type, :array
            items do
              key :type, :object
              property :attributes do
                key :type, :object
                key :'$ref', :Comment
              end
              property :id do
                key :type, :string
              end
              property :type do
                key :type, :string
              end
            end
          end
        end

        swagger_schema :JsonApiErrorArray do
          property :errors do
            key :type, :array
            items do
              key :type, :object
              key :'$ref', :Error
            end
          end
        end

        swagger_schema :Error do
          property :detail do
            key :type, :string
          end
          property :id do
            key :type, :string
          end
          property :status do
            key :type, :integer
          end
          property :meta do
            key :type, :object
            property :model do
              key :type, :string
            end
          end
        end

      end

    end

  end

# end