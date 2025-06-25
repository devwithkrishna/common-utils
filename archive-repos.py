import os
import requests
from dotenv import load_dotenv

def archive_repos(repo_list: list):
	"""
		    Archives a list of repositories using the GitHub REST API.

		    Args:
		        repo_list (list): A list of repository names to be archived.

		    The function iterates through the provided list of repositories, constructs
		    the appropriate API endpoint for each repository, and sends a PATCH request
		    to archive it. The response status code is printed to indicate success or failure.

		    Notes:
		        - The `owner` variable specifies the GitHub username or organization owning the repositories.
		        - The `GITHUB_TOKEN` environment variable must be set with a valid GitHub personal access token.
		        - The API endpoint used is `https://api.github.com/repos/{owner}/{repo}`.
		        - The payload for the PATCH request includes `{"archived": True}` to archive the repository.

		    Example:
		        archive_repos(["repo1", "repo2"])
	"""
	counter = 1
	owner = "devwithkrishna"  # GitHub username or organization owning the repositories
	for repo in repo_list:
		print(f"Archiving repository #{counter}: {repo}")
		counter += 1

		# Construct the GitHub API endpoint for the repository
		url = f"https://api.github.com/repos/{owner}/{repo}"

		# Define the request headers, including authorization and content type
		header = {
		            "Accept": "application/vnd.github.v3+json",
		            "Authorization": f"Bearer {os.getenv('GITHUB_TOKEN')}"
		        }

		# Send a PATCH request to archive the repository
		response = requests.patch(url=url, headers=header, json={"archived": "True"})

		# Print the response status code and handle different outcomes
		print(response.status_code)

		if response.status_code == 200:
			print(f"Repository {repo} archived successfully.")
		elif response.status_code == 404:
			print(f"Repository {repo} not found or already archived.")
		else:
			print(f"Failed to archive repository {repo}. Status code: {response.status_code}, Response: {response.text}")
def main():
	"""
		    Main function to load environment variables and archive repositories.

		    This function reads a list of repository names from a file named `archive_repos.txt`,
		    loads environment variables using `dotenv`, and prepares the list of repositories
		    to be archived.

		    Steps:
		        1. Load environment variables from a `.env` file.
		        2. Read repository names from `archive_repos.txt`.
		        3. Strip whitespace and filter out empty lines.
		        4. Print the total number of repositories to be archived.

		    Notes:
		        - The file `archive_repos.txt` should contain one repository name per line.
		        - Ensure the `.env` file is properly configured with required variables.

		    Example:
		        If `archive_repos.txt` contains:
		        ```
		        repo1
		        repo2
		        repo3
		        ```
		        The function will output:
		        `Total repositories to archive: 3`
	"""
	load_dotenv()  # Load environment variables from a `.env` file

	archive_repo_list = []  # Initialize an empty list to store repository names

	# Open the file containing repository names and read line by line
	with open("archive_repos.txt", "r") as file:
		for repo in file:
			repo = repo.strip()  # Remove leading/trailing whitespace
			if repo:  # Add non-empty repository names to the list
				archive_repo_list.append(repo)

		    # Print the total number of repositories to be archived
	print(f"Total repositories to archive: {len(archive_repo_list)}")
	archive_repos(repo_list=archive_repo_list)

if __name__ == "__main__":
	main()