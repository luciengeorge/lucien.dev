class UpdateRepoLanguagesJob < ApplicationJob
  queue_as :default

  def perform(repo)
    languages = $octokit.languages(repo.gh_id)
    languages_json = JSON.parse(RestClient.get('https://raw.githubusercontent.com/ozh/github-colors/master/colors.json'))
    languages.each do |language, size|
      color = languages_json.dig(language.to_s, 'color')
      @language = Language.find_or_create_by(name: language.to_s)
      @language.update!(color: color) if @language.color.nil?
      repo_language = RepoLanguage.find_by repo: repo, language: @language
      if repo_language.present?
        repo_language.update(size: size)
      else
        RepoLanguage.create!(
          repo: repo,
          language: @language,
          size: size
        )
      end
    end
  end
end
