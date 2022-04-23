RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def with_versioning
  was_enabled = PaperTrail.enabled?
  was_enabled_for_request = PaperTrail.request.enabled?
  PaperTrail.enabled = true
  PaperTrail.request.enabled = true
  begin
    yield
  ensure
    PaperTrail.enabled = was_enabled
    PaperTrail.request.enabled = was_enabled_for_request
  end
end
