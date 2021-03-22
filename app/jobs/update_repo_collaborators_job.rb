class UpdateRepoCollaboratorsJob < ApplicationJob
  queue_as :default

  def perform(repo)
    @repo = $octokit.repo(repo.gh_id)
    collaborators = @repo.rels[:collaborators].get.data
    collaborators.each do |collaborator|
      @collaborator = Collaborator.create_with(
        login: collaborator.login,
        gh_id: collaborator.id,
        avatar_url: collaborator.avatar_url,
        profile_url: collaborator.html_url,
        followers_url: collaborator.followers_url,
        following_url: collaborator.following_url,
        starred_url: collaborator.starred_url,
        gh_type: collaborator.type,
        api_url: collaborator.url
      ).find_or_create_by(gh_id: collaborator.gh_id)

      RepoCollaborator.find_or_create_by repo: repo, collaborator: @collaborator
    end
  end
end
