#!/usr/bin/sh
# Author:  Warwick Allen
# Created: 2024-02-13

# Outputs commands to run to set the Gitpod environment variables for the Azure role assignment.
# The file containing the variables (which includes a password) is encrypted with the following
# Keybase PGP key:
#    Keybase Key ID:  01018704f1fe0ed3d28a324d6a4c256b7801f885102bea5925bbf286c7efe3e490ac0a
#    PGP Fingerprint: 9f92c49840acbfade9e8f6382dfa90f79b24929b
#    PGP Identities:
#       Warwick Peter Malcolm Allen <warwick.peter.malcolm.allen@outlook.com>

keybase pgp decrypt -i ../.azure-contributor-role-assignment.json.asc 2>/dev/null |
perl -nle '
  s/
    "(.*)":\s*(".*")
  /
    $k = {qw,subscriptionId SUBSCRIPTION_ID appId CLIENT_ID password CLIENT_SECRET tenant TENANT_ID,}->{$1} and
    print "gp env -e ARM_$k=$2"
  /ex'