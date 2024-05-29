# # gem "pry", group: %i[development test]
gem 'i18n-debug', group: :development


gem "annotate", group: :development
after_bundle { generate "annotate:install" }


gem "formtastic"
after_bundle { generate "formtastic:install" }


gem "letter_opener", group: :development
environment 'config.action_mailer.delivery_method = :letter_opener', env: "development"


# gem "paper_trail"
# gem "paper_trail-association_tracking"
# after_bundle do
#   generate "paper_trail:install"#, "--with-changes"
#   generate "paper_trail_association_tracking:install"
# end


# # gem "postmark-rails"
# # environment "config.action_mailer.delivery_method = :postmark", env: "production"
# # environment "config.action_mailer.postmark_settings = { api_token: credentials.postmark&.api_token }", env: "production"


gem "haml-rails", "~> 2.0"
gem "html2haml", group: :development


# # gem "sentry-ruby"
# # gem "sentry-rails"


# # after_bundle do
# #   initializer "sentry.rb", <<-RUBY
# #     # From https://docs.sentry.io/platforms/ruby/guides/rails/#configure
# #     Sentry.init do |config|
# #       # get from https://sentry.io/settings/projects/
# #       # select project and then "Client Keys (DSN)"
# #       config.dsn = '<change me>'
# #       config.breadcrumbs_logger = [:active_support_logger, :http_logger]
# #       config.enabled_environments = %w[production]

# #       # Set traces_sample_rate to 1.0 to capture 100%
# #       # of transactions for performance monitoring.
# #       # We recommend adjusting this value in production.
# #       config.traces_sample_rate = 1.0
# #       # or
# #       config.traces_sampler = lambda do |context|
# #         true
# #       end
# #     end
# #   RUBY
# # end


gem "activerecord_where_assoc"
file "app/patches/active_record_patch.rb", <<-RUBY
  module ActiveRecordPatch
    include ApplicationPatch
    patches ActiveRecord

    module QueryMethods
      class WhereChain
        def exists(*args, &block)
          @scope.where_assoc_exists(*args, &block)
        end

        def not_exists(*args, &block)
          @scope.where_assoc_not_exists(*args, &block)
        end
      end
    end
  end
RUBY

# run_bundle

file "app/patches/application_patch.rb", <<-RUBY
  module ApplicationPatch
    extend ActiveSupport::Concern

    @@patches = []

    included do
      extend ActiveSupport::Concern
    end

    class_methods do
      def patches klass
        @@patches << klass
      end

      def apply!
        @@patches.each { _1.include self }
      end
    end

    def self.apply!
    end
  end
RUBY

initializer "patches.rb", <<-RUBY
  Rails.application.reloader.to_prepare do
    Dir.glob("**/*.rb", base: "app/patches") do |name|
      name.sub(/\.rb$/, '').camelize.constantize.apply!
    end
  end
RUBY
