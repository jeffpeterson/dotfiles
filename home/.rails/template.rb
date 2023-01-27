gem "pry"

# letter_opener
gem "letter_opener", group: :development
environment 'config.action_mailer.delivery_method = :letter_opener', env: "development"

# paper_trail
gem "paper_trail"
gem "paper_trail-association_tracking"
generate "paper_trail:install", "--with-changes"
generate "paper_trail_association_tracking:install"


# postmark
gem "postmark-rails"
environment "config.action_mailer.delivery_method = :postmark", env: "production"
environment "config.action_mailer.postmark_settings = { api_token: credentials.postmark&.api_token }", env: "production"


# haml
gem "haml-rails", "~> 2.0"
gem "html2haml"
gem "html2haml", group: :development


# sentry
gem "sentry-ruby"
gem "sentry-rails"
initializer "sentry.rb", <<-RUBY
  # From https://docs.sentry.io/platforms/ruby/guides/rails/#configure
  Sentry.init do |config|
    # get from https://sentry.io/settings/projects/
    # select project and then "Client Keys (DSN)"
    config.dsn = '<change me>'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
    config.enabled_environments = %w[production]

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end
RUBY

# activerecord_where_assoc
gem "activerecord_where_assoc"
file "app/patches/active_record.rb", <<-RUBY
  module ActiveRecord
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
