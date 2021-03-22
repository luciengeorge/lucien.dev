class UpdateRepoLanguagesJob < ApplicationJob
  queue_as :default

  def perform(repo)
    @repo = $octokit.repo(repo.gh_id)
    languages = @repo.rels[:languages].get.data
    languages.each do |language, size|
      @language = Language.find_or_create_by(name: language.to_s)
      repo_language = RepoLanguage.find_by repo: repo, language: @language
      if repo_language.present?
        repo_language.update(size: size)
      else
        RepoLanguage.create(
          repo: repo,
          language: @language,
          size: size
        )
      end
    end
  end
end
