unless Rails.env.test?
  require "refile/s3"

  aws = {
    access_key_id: "AKIAJXDSOF434CRKQJBQ",
    secret_access_key: "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",
    region: "eu-west-1",
    bucket: "toolsforteachers-#{ Rails.env }"
  }

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
