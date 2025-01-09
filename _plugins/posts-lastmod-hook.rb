#!/usr/bin/env ruby
#
# Check for changed posts

Jekyll::Hooks.register :posts, :post_init do |post|

  # Check if the file is tracked by Git
  is_tracked = `git ls-files --error-unmatch "#{ post.path }" 2>/dev/null`
    
  # Skip processing if the file is not tracked
  if $?.exitstatus != 0
    Jekyll.logger.warn "Git Hook:", "Skipping untracked file: #{ post.path }"
    next
  end

  # Get the number of commits for the post
  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  # If the file has been committed at least once, update metadata
  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
    post.data['last_modified_at'] = lastmod_date
  end
  end
