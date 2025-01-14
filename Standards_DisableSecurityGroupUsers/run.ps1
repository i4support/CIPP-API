param($tenant)

try {
    $body = '{"defaultUserRolePermissions":{"allowedToCreateSecurityGroups":false}}'
    (New-GraphPostRequest -tenantid $tenant -Uri "https://graph.microsoft.com/beta/policies/authorizationPolicy/authorizationPolicy" -Type patch -Body $body -ContentType "application/json")

    Log-request -API "Standards" -tenant $tenant -message "Standards API: Disabled users from creating Security Groups." -sev Info
}
catch {
    Log-request -API "Standards" -tenant $tenant -message  "Failed to disable users from creating Security Groups: $($_.exception.message)"
}
