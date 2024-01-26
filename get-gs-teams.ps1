# Connect to Microsoft Teams
Connect-MicrosoftTeams

$csvOutputfile = C:\Users\bhumphreys\Git\teams-powershell\output\teams.csv
# Get all the teams in the tenant
$teams = Get-Team
#$filteredTeams = $teams| Where-Object DisplayName -CContains "GS"
#$filteredTeams | Out-GridView


# Create an empty array to store the output

$counter = 0
"Total Teams" + $teams.Length

[System.Collections.ArrayList]$filteredTeams = New-Object -TypeName System.Collections.ArrayList
# Loop through each team
foreach ($team in $teams) {
    if ($team.DisplayName.Contains("gs") -or $team.DisplayName.Contains("GS" )) {
        <# Action to perform if the condition is true #>
        $filteredTeams += $team
        $counter  +=1
    }
}
$filteredTeams = $filteredTeams | Sort-Object -Property DisplayName



# # Get the team name and id
# $teamName = $team.DisplayName
# $teamDescription = $team.Description
# $teamId = $team.GroupId
# $counter += 1
# $team.DisplayName + $counter
# # Get the owners of the team
# $owners = Get-TeamUser -GroupId $teamId -Role Owner

# # Create a string to store the owner names
# $ownerNames = ""

# # Loop through each owner
# foreach ($owner in $owners) {

#     # Append the owner name to the string
#     $ownerNames += $owner.User + ";"
# }

# # Remove the trailing semicolon
# $ownerNames = $ownerNames.TrimEnd(";")

# # Create a custom object to store the team name, id, and owners
# $object = [PSCustomObject]@{
#     TeamName   = $teamName
#     TeamId     = $teamId
#     OwnerNames = $ownerNames

# }

# # Add the object to the output array
# $output += $object
# }

# # Export the output array to a CSV file
# $output | Export-Csv -Path $csvOutputfile -NoTypeInformation
