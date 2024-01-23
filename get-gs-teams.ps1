# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Get all the teams in the tenant
$teams = Get-Team

# Create an empty array to store the output
$output = @()

# Loop through each team
foreach ($team in $teams) {

  # Get the team name and id
  $teamName = $team.DisplayName
  $teamId = $team.GroupId

  # Get the owners of the team
  $owners = Get-TeamUser -GroupId $teamId -Role Owner

  # Create a string to store the owner names
  $ownerNames = ""

  # Loop through each owner
  foreach ($owner in $owners) {

    # Append the owner name to the string
    $ownerNames += $owner.User + ";"
  }

  # Remove the trailing semicolon
  $ownerNames = $ownerNames.TrimEnd(";")

  # Create a custom object to store the team name, id, and owners
  $object = [PSCustomObject]@{
    TeamName = $teamName
    TeamId = $teamId
    Owners = $ownerNames
  }

  # Add the object to the output array
  $output += $object
}

# Export the output array to a CSV file
$output | Export-Csv -Path "C:\teams_owners.csv" -NoTypeInformation
